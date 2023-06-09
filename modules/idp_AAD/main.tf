#
# Copyright (c) 2023 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

/*resource "ocm_identity_provider" "gitlab_idp" {
  cluster = "my-cluster"
  name    = "Gitlab"
  gitlab = {
    client_id     = var.gitlab_client_id
    client_secret = var.gitlab_client_secret
    url           = var.gitlab_url
  }
}*/

resource "ocm_identity_provider" "aad_idp" {
  cluster = var.cluster_name
  name    = var.idp_name
  openid = {
    claims     = {
        name = ["name"]
        email = ["email"]
    }
    client_id = var.aad_client_id
    client_secret = var.aad_client_secret
    issuer = "https://login.microsoftonline.com/${var.aad_tenant_id}/v2.0"
    #ca =
    #extra_authorize_parameters=
    #extra_scopes=
  }
}