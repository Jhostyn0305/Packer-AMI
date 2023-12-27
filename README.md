<p align="center"><a href="https://www.packer.io/" target="_blank"><img src="https://www.datocms-assets.com/21211/1597048171-packerwide.jpg?auto=format" width="400" alt="Packer Logo"></a></p>

# Packer para el aprovisionamiento de un proyecto Node.js en una instancia AWS.

El template del proyecto generará una imágen (AMI), la cual será aprovisianada a través de comandos bash debido a que el sistema operativo de la AMI es Ubuntu, una vez instala node se copiará en las rutas específicias.


## Herramientas de instalación:
Las plantilla maneja las siguientes herramientas para el correcto funcionamiento:
- **[Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)**
- **[Plugin Amazon Packer](https://developer.hashicorp.com/packer/integrations/hashicorp/amazon)**
- **[Cuenta Amazon](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3FhashArgs%3D%2523%26isauthcode%3Dtrue%26nc2%3Dh_ct%26src%3Dheader-signin%26state%3DhashArgsFromTB_us-east-2_2b8a9e540b7fadfc&client_id=arn%3Aaws%3Asignin%3A%3A%3Aconsole%2Fcanvas&forceMobileApp=0&code_challenge=HCke3mv3aOkT1mIvswA6iJEgdtasLiLbRlmuvJANlTc&code_challenge_method=SHA-256)**
- **[Amazon CLI](https://docs.aws.amazon.com/es_es/cli/latest/userguide/getting-started-install.html)**

### Ejecución
Una vez instaladas las dependencias anteriores, se puede proceder a ejecutar la planitalla.

Validar la plantilla:
`````
packer validate template_aws.json
`````
Si la validación está totalmente correcta, se procede a construir:
`````
packer build template_aws.json
`````

#### Explicación
La plantilla se compone de:
* <b>variables:</b> Se albergará la información genérica para los builders, en este caso se harán uso de las siguientes variables: 
  * <b>aws_access_key:</b> Clave de acceso generado en AWS. o aws_secret_key: Clave secreta generada en AWS. 
  * <b>aws_region:</b> Región en donde se montará la máquina virtual, para verificar las regiones y escoger la mejor que convenga se hizo uso del siguiente enlace.  https://aws.amazon.com/es/about-aws/globalinfrastructure/regions_az 
  * <b>image_namig:</b> El nombre identificado con el que se creará la imagen. 
o	<b>username:</b> Es el nombre usuario por el medio que se podrá conectar a ssh. 
* <b>builders:</b> En este caso ejecuta el proceso para la construcción de la AMI (Amazon Machine Image), en este caso es el proceso de construcción de la imagen, tomando en cuenta los atributos más importantes. 
o	<b>Nota:</b> Cabe mencionar que para que ejecute correctamente el builder se debe tener instalado con anterioridad el plugin de amazon-ebs. 
o	https://developer.hashicorp.com/packer/integrations/hashicorp/ amazon  
•	<b>provisioners:</b> Este apartado es importante ya que será el encargado de instalar el nodejs y la puesta en marcha del proyecto con la palabra Hola Mundo. 
 
* <b>post-processors:</b> Es un atributo adicional y ejecuta después de haber creado la imagen, en este caso se ejecutarán dos, uno que muestre un resumen de la construcción y el otro que genere automáticamente la instancia de la imagen. 
 
o	<b>Nota:</b> El segundo post procesor es el más importante debido a que es el necesario para que la instancia sea generada automáticamente, cabe mencionar que depende del resultado del manifest ya que ahí se encuentra la información del artifact_id que representa el identificador de la imagen. 
