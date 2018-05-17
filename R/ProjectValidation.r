# Looker API 3.0 Reference
# 
# ### Authorization  The Looker API uses Looker **API3** credentials for authorization and access control. Looker admins can create API3 credentials on Looker's **Admin/Users** page. Pass API3 credentials to the **/login** endpoint to obtain a temporary access_token. Include that access_token in the Authorization header of Looker API requests. For details, see [Looker API Authorization](https://looker.com/docs/r/api/authorization)  ### Client SDKs  The Looker API is a RESTful system that should be usable by any programming language capable of making HTTPS requests. Client SDKs for a variety of programming languages can be generated from the Looker API's Swagger JSON metadata to streamline use of the Looker API in your applications. A client SDK for Ruby is available as an example. For more information, see [Looker API Client SDKs](https://looker.com/docs/r/api/client_sdks)  ### Try It Out!  The 'api-docs' page served by the Looker instance includes 'Try It Out!' buttons for each API method. After logging in with API3 credentials, you can use the \"Try It Out!\" buttons to call the API directly from the documentation page to interactively explore API features and responses.  ### Versioning  Future releases of Looker will expand this API release-by-release to securely expose more and more of the core power of Looker to API client applications. API endpoints marked as \"beta\" may receive breaking changes without warning. Stable (non-beta) API endpoints should not receive breaking changes in future releases. For more information, see [Looker API Versioning](https://looker.com/docs/r/api/versioning) 
# 
# OpenAPI spec version: 3.0.0
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' ProjectValidation Class
#'
#' @field errors 
#' @field project_digest 
#' @field models_not_validated 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
ProjectValidation <- R6::R6Class(
  'ProjectValidation',
  public = list(
    `errors` = NULL,
    `project_digest` = NULL,
    `models_not_validated` = NULL,
    initialize = function(`errors`, `project_digest`, `models_not_validated`){
      if (!missing(`errors`)) {
        stopifnot(is.list(`errors`), length(`errors`) != 0)
        lapply(`errors`, function(x) stopifnot(R6::is.R6(x)))
        self$`errors` <- `errors`
      }
      if (!missing(`project_digest`)) {
        stopifnot(is.character(`project_digest`), length(`project_digest`) == 1)
        self$`project_digest` <- `project_digest`
      }
      if (!missing(`models_not_validated`)) {
        stopifnot(is.list(`models_not_validated`), length(`models_not_validated`) != 0)
        lapply(`models_not_validated`, function(x) stopifnot(R6::is.R6(x)))
        self$`models_not_validated` <- `models_not_validated`
      }
    },
    toJSON = function() {
      ProjectValidationObject <- list()
      if (!is.null(self$`errors`)) {
        ProjectValidationObject[['errors']] <- lapply(self$`errors`, function(x) x$toJSON())
      }
      if (!is.null(self$`project_digest`)) {
        ProjectValidationObject[['project_digest']] <- self$`project_digest`
      }
      if (!is.null(self$`models_not_validated`)) {
        ProjectValidationObject[['models_not_validated']] <- lapply(self$`models_not_validated`, function(x) x$toJSON())
      }

      ProjectValidationObject
    },
    fromJSON = function(ProjectValidationJson) {
      ProjectValidationObject <- jsonlite::fromJSON(ProjectValidationJson)
      if (!is.null(ProjectValidationObject$`errors`)) {
        self$`errors` <- lapply(ProjectValidationObject$`errors`, function(x) {
          errorsObject <- ProjectError$new()
          errorsObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          errorsObject
        })
      }
      if (!is.null(ProjectValidationObject$`project_digest`)) {
        self$`project_digest` <- ProjectValidationObject$`project_digest`
      }
      if (!is.null(ProjectValidationObject$`models_not_validated`)) {
        self$`models_not_validated` <- lapply(ProjectValidationObject$`models_not_validated`, function(x) {
          models_not_validatedObject <- ModelsNotValidated$new()
          models_not_validatedObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          models_not_validatedObject
        })
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "errors": [%s],
           "project_digest": %s,
           "models_not_validated": [%s]
        }',
        lapply(self$`errors`, function(x) paste(x$toJSON(), sep=",")),
        self$`project_digest`,
        lapply(self$`models_not_validated`, function(x) paste(x$toJSON(), sep=","))
      )
    },
    fromJSONString = function(ProjectValidationJson) {
      ProjectValidationObject <- jsonlite::fromJSON(ProjectValidationJson)
      self$`errors` <- lapply(ProjectValidationObject$`errors`, function(x) ProjectError$new()$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE)))
      self$`project_digest` <- ProjectValidationObject$`project_digest`
      self$`models_not_validated` <- lapply(ProjectValidationObject$`models_not_validated`, function(x) ModelsNotValidated$new()$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE)))
    }
  )
)
