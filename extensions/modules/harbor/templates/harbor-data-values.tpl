#@data/values
#@overlay/match-child-defaults missing_ok=True
---

# Docker images setting
image:
  repository: projects.registry.vmware.com/tkg/harbor
  tag: v2.1.3_vmware.1
  pullPolicy: IfNotPresent
# The namespace to install Harbor
namespace: tanzu-system-registry
# The FQDN for accessing Harbor admin UI and Registry service.
hostname: ${harbor_ingress_fqdn}
# The network port of the Envoy service in Contour or other Ingress Controller.
port:
  https: 443
# [Optional] The certificate for the ingress if you want to use your own TLS certificate.
# We will issue the certificate by cert-manager when it's empty.
tlsCertificate:
  # [Required] the certificate
  tls.crt:
  # [Required] the private key
  tls.key:
  # [Optional] the certificate of CA, this enables the download
  # link on portal to download the certificate of CA
  ca.crt:
# Use contour http proxy instead of the ingress when it's true
enableContourHttpProxy: true
# [Required] The initial password of Harbor admin.
harborAdminPassword: ${harbor_admin_password}
# [Required] The secret key used for encryption. Must be a string of 16 chars.
secretKey: ${harbor_secret_key}
database:
  # [Required] The initial password of the postgres database.
  password: ${harbor_db_password}
core:
  replicas: 1
  # [Required] Secret is used when core server communicates with other components.
  secret: ${harbor_core_secret}
  # [Required] The XSRF key. Must be a string of 32 chars.
  xsrfKey: ${harbor_xsrf_key}
jobservice:
  replicas: 1
  # [Required] Secret is used when job service communicates with other components.
  secret: ${harbor_jobservice_secret}
registry:
  replicas: 1
  # [Required] Secret is used to secure the upload state from client
  # and registry storage backend.
  # See: https://github.com/docker/distribution/blob/master/docs/configuration.md#http
  secret: ${harbor_registry_secret}
notary:
  # Whether to install Notary
  enabled: ${harbor_enable_notary}
clair:
  # Whether to install Clair scanner
  enabled: ${harbor_enable_clair}
  replicas: 1
  # The interval of clair updaters, the unit is hour, set to 0 to
  # disable the updaters
  updatersInterval: 12
trivy:
  # enabled the flag to enable Trivy scanner
  enabled: ${harbor_enable_trivy}
  replicas: 1
  # gitHubToken the GitHub access token to download Trivy DB
  gitHubToken: ""
  # skipUpdate the flag to disable Trivy DB downloads from GitHub
  #
  # You might want to set the value of this flag to `true` in test or CI/CD environments to avoid GitHub rate limiting issues.
  # If the value is set to `true` you have to manually download the `trivy.db` file and mount it in the
  # `/home/scanner/.cache/trivy/db/trivy.db` path.
  skipUpdate: false
# The persistence is always enabled and a default StorageClass
# is needed in the k8s cluster to provision volumes dynamicly.
# Specify another StorageClass in the "storageClass" or set "existingClaim"
# if you have already existing persistent volumes to use
#
# For storing images and charts, you can also use "azure", "gcs", "s3",
# "swift" or "oss". Set it in the "imageChartStorage" section
persistence:
  persistentVolumeClaim:
    registry:
      # Use the existing PVC which must be created manually before bound,
      # and specify the "subPath" if the PVC is shared with other components
      existingClaim: ""
      # Specify the "storageClass" used to provision the volume. Or the default
      # StorageClass will be used(the default).
      # Set it to "-" to disable dynamic provisioning
      storageClass: ""
      subPath: ""
      accessMode: ReadWriteOnce
      size: ${harbor_registry_pv_size_gb}Gi
    jobservice:
      existingClaim: ""
      storageClass: ""
      subPath: ""
      accessMode: ReadWriteOnce
      size: 1Gi
    database:
      existingClaim: ""
      storageClass: ""
      subPath: ""
      accessMode: ReadWriteOnce
      size: 1Gi
    redis:
      existingClaim: ""
      storageClass: ""
      subPath: ""
      accessMode: ReadWriteOnce
      size: 1Gi
    trivy:
      existingClaim: ""
      storageClass: ""
      subPath: ""
      accessMode: ReadWriteOnce
      size: 5Gi
  # Define which storage backend is used for registry and chartmuseum to store
  # images and charts. Refer to
  # https://github.com/docker/distribution/blob/master/docs/configuration.md#storage
  # for the detail.
  imageChartStorage:
    # Specify whether to disable `redirect` for images and chart storage, for
    # backends which not supported it (such as using minio for `s3` storage type), please disable
    # it. To disable redirects, simply set `disableredirect` to `true` instead.
    # Refer to
    # https://github.com/docker/distribution/blob/master/docs/configuration.md#redirect
    # for the detail.
    disableredirect: false
    # Specify the "caBundleSecretName" if the storage service uses a self-signed certificate.
    # The secret must contain keys named "ca.crt" which will be injected into the trust store
    # of registry's and chartmuseum's containers.
    # caBundleSecretName:

    # Specify the type of storage: "filesystem", "azure", "gcs", "s3", "swift",
    # "oss" and fill the information needed in the corresponding section. The type
    # must be "filesystem" if you want to use persistent volumes for registry
    # and chartmuseum
    type: filesystem
    filesystem:
      rootdirectory: /storage
      #maxthreads: 100
    azure:
      accountname: accountname # required
      accountkey: base64encodedaccountkey # required
      container: containername # required
      realm: core.windows.net # optional
    gcs:
      bucket: bucketname # required
      # The base64 encoded json file which contains the key
      encodedkey: base64-encoded-json-key-file # optional
      rootdirectory: null # optional
      chunksize: 5242880 # optional
    s3:
      region: us-west-1 # required
      bucket: bucketname # required
      accesskey: null # eg, awsaccesskey
      secretkey: null # eg, awssecretkey
      regionendpoint: null # optional, eg, http://myobjects.local
      encrypt: false # optional
      keyid: null # eg, mykeyid
      secure: true # optional
      v4auth: true # optional
      chunksize: null # optional
      rootdirectory: null # optional
      storageclass: STANDARD # optional
    swift:
      authurl: https://storage.myprovider.com/v3/auth
      username: username
      password: password
      container: containername
      region: null # eg, fr
      tenant: null # eg, tenantname
      tenantid: null # eg, tenantid
      domain: null # eg, domainname
      domainid: null # eg, domainid
      trustid: null # eg, trustid
      insecureskipverify: null # bool eg, false
      chunksize: null # eg, 5M
      prefix: null # eg
      secretkey: null # eg, secretkey
      accesskey: null # eg, accesskey
      authversion: null # eg, 3
      endpointtype: null # eg, public
      tempurlcontainerkey: null # eg, false
      tempurlmethods: null # eg
    oss:
      accesskeyid: accesskeyid
      accesskeysecret: accesskeysecret
      region: regionname
      bucket: bucketname
      endpoint: null # eg, endpoint
      internal: null # eg, false
      encrypt: null # eg, false
      secure: null # eg, true
      chunksize: null # eg, 10M
      rootdirectory: null # eg, rootdirectory
# The http/https network proxy for clair, core, jobservice, trivy
proxy:
  httpProxy:
  httpsProxy:
  noProxy: 127.0.0.1,localhost,.local,.internal
