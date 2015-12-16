# Change Log

## [v1.0.1](https://github.com/nubisproject/nubis-consul/tree/v1.0.1) (2015-11-20)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.0.0...v1.0.1)

**Closed issues:**

- Tag  release [\#91](https://github.com/nubisproject/nubis-consul/issues/91)
- Enable leave\_on\_terminate for saner, faster rolling upgrades [\#89](https://github.com/nubisproject/nubis-consul/issues/89)
- Hardcoded region [\#83](https://github.com/nubisproject/nubis-consul/issues/83)

**Merged pull requests:**

- Update AMI IDs file for v1.0.1 release [\#96](https://github.com/nubisproject/nubis-consul/pull/96) ([tinnightcap](https://github.com/tinnightcap))
- Leftover cleanups [\#94](https://github.com/nubisproject/nubis-consul/pull/94) ([gozer](https://github.com/gozer))
- Enable leave\_on\_terminate [\#90](https://github.com/nubisproject/nubis-consul/pull/90) ([gozer](https://github.com/gozer))
- Remove hardcoded region value [\#84](https://github.com/nubisproject/nubis-consul/pull/84) ([limed](https://github.com/limed))

## [v1.0.0](https://github.com/nubisproject/nubis-consul/tree/v1.0.0) (2015-08-31)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v0.9.0...v1.0.0)

**Implemented enhancements:**

- Support multiple Consul clusters per account [\#71](https://github.com/nubisproject/nubis-consul/issues/71)
- Build support for ACL tokens [\#27](https://github.com/nubisproject/nubis-consul/issues/27)
- Replace bootstrap node with AWS ASG Discovery [\#21](https://github.com/nubisproject/nubis-consul/issues/21)
- Get rid of override.tf, now that we can split strings in Terraform [\#75](https://github.com/nubisproject/nubis-consul/pull/75) ([gozer](https://github.com/gozer))

**Closed issues:**

- Also run a public IP-Restricted ELB [\#78](https://github.com/nubisproject/nubis-consul/issues/78)
- get rid of the need for override.tf [\#73](https://github.com/nubisproject/nubis-consul/issues/73)
- Instead of publishing secrets into Consul from Terraform, let the Consul servers [\#66](https://github.com/nubisproject/nubis-consul/issues/66)
- Sanitize override.tf-dist [\#51](https://github.com/nubisproject/nubis-consul/issues/51)
- Variable interpolation is broken for provider "consul" [\#44](https://github.com/nubisproject/nubis-consul/issues/44)
- Using security\_groups in aws\_instance does not work with our current setup [\#41](https://github.com/nubisproject/nubis-consul/issues/41)
- Missing tfvar variable [\#40](https://github.com/nubisproject/nubis-consul/issues/40)
- README improvements [\#37](https://github.com/nubisproject/nubis-consul/issues/37)
- All secrets for all products are available on the internet to unauthenticated users [\#64](https://github.com/nubisproject/nubis-consul/issues/64)
- Tag v1.0.0 release [\#48](https://github.com/nubisproject/nubis-consul/issues/48)
- Backups for the K/V Store [\#30](https://github.com/nubisproject/nubis-consul/issues/30)

**Merged pull requests:**

- Add a new option :allowed\_public\_cidrs [\#79](https://github.com/nubisproject/nubis-consul/pull/79) ([gozer](https://github.com/gozer))
- Support Environment per VPCs in one account [\#74](https://github.com/nubisproject/nubis-consul/pull/74) ([gozer](https://github.com/gozer))
- Busy wait, but do it at a reaasonable pace [\#70](https://github.com/nubisproject/nubis-consul/pull/70) ([gozer](https://github.com/gozer))
- Stop using a bootstrap node and discover our peers via self-inspection of our auto-scaling group. [\#67](https://github.com/nubisproject/nubis-consul/pull/67) ([gozer](https://github.com/gozer))
- Make Consul reside inside the VPC, so it's not accessible over the internet at all anymore. [\#65](https://github.com/nubisproject/nubis-consul/pull/65) ([gozer](https://github.com/gozer))
- Consul backups [\#60](https://github.com/nubisproject/nubis-consul/pull/60) ([limed](https://github.com/limed))
- Update tfvars to include manage\_iam variables [\#59](https://github.com/nubisproject/nubis-consul/pull/59) ([limed](https://github.com/limed))
- Terraform outputs variable fixes [\#58](https://github.com/nubisproject/nubis-consul/pull/58) ([limed](https://github.com/limed))
- Install consulate python package [\#56](https://github.com/nubisproject/nubis-consul/pull/56) ([limed](https://github.com/limed))
- Minor Terraform cleanups [\#55](https://github.com/nubisproject/nubis-consul/pull/55) ([gozer](https://github.com/gozer))
- Fix terraform route53 resource [\#54](https://github.com/nubisproject/nubis-consul/pull/54) ([limed](https://github.com/limed))
- remove S3 work, shouldn't have made it to master [\#45](https://github.com/nubisproject/nubis-consul/pull/45) ([gozer](https://github.com/gozer))
- Tfvars variable add [\#39](https://github.com/nubisproject/nubis-consul/pull/39) ([limed](https://github.com/limed))
- merge [\#36](https://github.com/nubisproject/nubis-consul/pull/36) ([gozer](https://github.com/gozer))

## [v0.9.0](https://github.com/nubisproject/nubis-consul/tree/v0.9.0) (2015-07-22)
**Closed issues:**

- Enable dns\_config.enable\_truncate so we can return more than 3 results. [\#24](https://github.com/nubisproject/nubis-consul/issues/24)
- Change start\_join to retry\_join, this way, we get aggressive about retrying. [\#17](https://github.com/nubisproject/nubis-consul/issues/17)
- convert to nubis-builder [\#12](https://github.com/nubisproject/nubis-consul/issues/12)
- Upgrade to 0.5.0 [\#11](https://github.com/nubisproject/nubis-consul/issues/11)
- Consider setting the node name to the instance id [\#9](https://github.com/nubisproject/nubis-consul/issues/9)
- Need to integrate consul-replicate in the images [\#5](https://github.com/nubisproject/nubis-consul/issues/5)
- Need support for SSL [\#4](https://github.com/nubisproject/nubis-consul/issues/4)
- Optionally use the public-ip in advertisements [\#3](https://github.com/nubisproject/nubis-consul/issues/3)

**Merged pull requests:**

- Updating changelog for v0.9.0 release [\#34](https://github.com/nubisproject/nubis-consul/pull/34) ([gozer](https://github.com/gozer))
- Upgrades [\#25](https://github.com/nubisproject/nubis-consul/pull/25) ([gozer](https://github.com/gozer))
- Convert to new-new-new VPC design with security group sauce. [\#23](https://github.com/nubisproject/nubis-consul/pull/23) ([gozer](https://github.com/gozer))
- include ASG nodes in the UI load-balancer [\#20](https://github.com/nubisproject/nubis-consul/pull/20) ([gozer](https://github.com/gozer))
- Don't nuke /etc/consul, base already dropped things in there. [\#19](https://github.com/nubisproject/nubis-consul/pull/19) ([gozer](https://github.com/gozer))
- Convert to using VPCs [\#18](https://github.com/nubisproject/nubis-consul/pull/18) ([gozer](https://github.com/gozer))
- bump [\#16](https://github.com/nubisproject/nubis-consul/pull/16) ([gozer](https://github.com/gozer))
- Conversion to Consul 0.5.0 and with SSL/TLS support [\#15](https://github.com/nubisproject/nubis-consul/pull/15) ([gozer](https://github.com/gozer))
- Cleanups [\#14](https://github.com/nubisproject/nubis-consul/pull/14) ([gozer](https://github.com/gozer))
- Convert to nubis-builder [\#13](https://github.com/nubisproject/nubis-consul/pull/13) ([gozer](https://github.com/gozer))
- set node name to instance id, fixes issue \#9 [\#10](https://github.com/nubisproject/nubis-consul/pull/10) ([gozer](https://github.com/gozer))
- Rebuild AMIs at release 10 [\#8](https://github.com/nubisproject/nubis-consul/pull/8) ([gozer](https://github.com/gozer))
- Cleanup work [\#7](https://github.com/nubisproject/nubis-consul/pull/7) ([gozer](https://github.com/gozer))
- Add a public option [\#6](https://github.com/nubisproject/nubis-consul/pull/6) ([gozer](https://github.com/gozer))
- Initial drop [\#2](https://github.com/nubisproject/nubis-consul/pull/2) ([gozer](https://github.com/gozer))
- Adding MPL2 License [\#1](https://github.com/nubisproject/nubis-consul/pull/1) ([tinnightcap](https://github.com/tinnightcap))



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*