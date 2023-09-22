
resource "aviatrix_smart_group" "Prod_Smartgroup" {
  name = var.Prod_Smartgroup
  selector {
    match_expressions {
      type         = "vm"
      tags         = {
        Env = "Production"
      }
    }
  }
}

resource "aviatrix_smart_group" "Dev_Smartgroup" {
  name = var.Dev_Smartgroup
  selector {
    match_expressions {
      type         = "vm"
      tags         = {
        Env = "Development"
      }
    }
  }
}

resource "aviatrix_smart_group" "QA_Smartgroup" {
  name = var.QA_Smartgroup
  selector {
    match_expressions {
      type         = "vm"
      tags         = {
        Env = "QA"
      }
    }
  }
}

resource "aviatrix_web_group" "Webgroup_1" {
  name = var.Webgroup_1
  selector {
    match_expressions {
      snifilter = var.Webgroup_1_SNI_Filter
    }
  }
}

resource "aviatrix_smart_group" "Rewards_Smartgroup" {
  name = "Rewards"
  selector {
    match_expressions {
      type         = "vm"
      tags         = {
        App = "Rewards"
      }
    }
  }
}

resource "aviatrix_smart_group" "Delivery_Smartgroup" {
  name = "Delivery"
  selector {
    match_expressions {
      type         = "vm"
      tags         = {
        App = "Delivery"
      }
    }
  }
}

resource "aviatrix_smart_group" "Collection_Smartgroup" {
  name = "Collection"
  selector {
    match_expressions {
      type         = "vm"
      tags         = {
        App = "Collection"
      }
    }
  }
}

resource "aviatrix_smart_group" "Web_Tier" {
  name = "Web-Tier"
  selector {
    match_expressions {
      type         = "vm"
      tags         = {
        tier = "web"
      }
    }
  }
}
resource "aviatrix_smart_group" "App_Tier" {
  name = "App-Tier"
  selector {
    match_expressions {
      type         = "vm"
      tags         = {
        tier = "app"
      }
    }
  }
}

resource "aviatrix_smart_group" "DB_Tier" {
  name = "DB_Tier"
  selector {
    match_expressions {
      type         = "vm"
      tags         = {
        tier = "db"
      }
    }
  }
}

resource "aviatrix_distributed_firewalling_config" "Turn-On-FW" {
  enable_distributed_firewalling = true
}

resource "aviatrix_distributed_firewalling_policy_list" "Secure-Egress-Policy" {
  policies {
    name             = "Secure-Egress"
    action           = "PERMIT"
    priority         = 10
    protocol         = "TCP"
    web_groups       = [aviatrix_web_group.Webgroup_1.uuid]
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Prod_Smartgroup.uuid
    ]
    dst_smart_groups = [
      "def000ad-0000-0000-0000-000000000001"
    ]
  }

  policies {
    name             = "Prod-to-Dev"
    action           = "DENY"
    priority         = 20
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Prod_Smartgroup.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.Dev_Smartgroup.uuid
    ]
  }

  policies {
    name             = "Dev-to-Prod"
    action           = "DENY"
    priority         = 30
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Dev_Smartgroup.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.Prod_Smartgroup.uuid
    ]
  }

  policies {
    name             = "Dev-to-QA"
    action           = "DENY"
    priority         = 40
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Dev_Smartgroup.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.QA_Smartgroup.uuid
    ]
  }
  policies {
    name             = "QA-to-Dev"
    action           = "DENY"
    priority         = 50
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.QA_Smartgroup.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.Dev_Smartgroup.uuid
    ]
  }
  policies {
    name             = "Prod-to-QA"
    action           = "DENY"
    priority         = 60
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Prod_Smartgroup.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.QA_Smartgroup.uuid
    ]
  }
  policies {
    name             = "QA-to-Prod"
    action           = "DENY"
    priority         = 70
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.QA_Smartgroup.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.Prod_Smartgroup.uuid
    ]
  }
  
  policies {
    name             = "Rewards-to-Delivery"
    action           = "DENY"
    priority         = 80
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Rewards_Smartgroup.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.Delivery_Smartgroup.uuid
    ]
  }

  policies {
    name             = "Delivery-to-Rewards"
    action           = "DENY"
    priority         = 90
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Delivery_Smartgroup.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.Rewards_Smartgroup.uuid
    ]
  }
  policies {
    name             = "Rewards-to-Collection"
    action           = "DENY"
    priority         = 100
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Rewards_Smartgroup.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.Collection_Smartgroup.uuid
    ]
  }
  policies {
    name             = "Collection-to-Rewards"
    action           = "DENY"
    priority         = 110
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Collection_Smartgroup.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.Rewards_Smartgroup.uuid
    ]
  }
  policies {
    name             = "Web-to-App"
    action           = "PERMIT"
    priority         = 120
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Web_Tier.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.App_Tier.uuid
    ]
  }
  policies {
    name             = "App-to-DB"
    action           = "PERMIT"
    priority         = 130
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.App_Tier.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.DB_Tier.uuid
    ]
  }
  policies {
    name             = "Web-to-DB"
    action           = "DENY"
    priority         = 140
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.Web_Tier.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.DB_Tier.uuid
    ]
  }
  policies {
    name             = "DB-to-Web"
    action           = "DENY"
    priority         = 140
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.DB_Tier.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.Web_Tier.uuid
    ]
  }
  policies {
    name             = "DB-to-App"
    action           = "DENY"
    priority         = 140
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.DB_Tier.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.App_Tier.uuid
    ]
  }
  
}



