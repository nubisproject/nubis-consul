# Change Log

## [v1.5.0](https://github.com/nubisproject/nubis-consul/tree/v1.5.0) (2017-06-24)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.4.2...v1.5.0)

**Closed issues:**

- Get rid of DataDog [\#291](https://github.com/nubisproject/nubis-consul/issues/291)
- Upgrade to Consul 0.8.3 [\#275](https://github.com/nubisproject/nubis-consul/issues/275)

**Merged pull requests:**

- Add instance mfa \(DUO\) variables to consul [\#294](https://github.com/nubisproject/nubis-consul/pull/294) ([tinnightcap](https://github.com/tinnightcap))
- Get rid of DataDog [\#293](https://github.com/nubisproject/nubis-consul/pull/293) ([gozer](https://github.com/gozer))
- Add support for SSO security group [\#290](https://github.com/nubisproject/nubis-consul/pull/290) ([gozer](https://github.com/gozer))
- Use random node IDs [\#289](https://github.com/nubisproject/nubis-consul/pull/289) ([gozer](https://github.com/gozer))
- Upgrade to Consul v0.8.3, with the new ACLs disabled [\#288](https://github.com/nubisproject/nubis-consul/pull/288) ([gozer](https://github.com/gozer))

## [v1.4.2](https://github.com/nubisproject/nubis-consul/tree/v1.4.2) (2017-05-05)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.4.1...v1.4.2)

**Closed issues:**

- Add nubis/builder/artifacts/AMIs.json to .gitignore [\#278](https://github.com/nubisproject/nubis-consul/issues/278)
- \[consul-aws-join\] Handle more gracefully the case where no peers are known [\#276](https://github.com/nubisproject/nubis-consul/issues/276)
- Tag v1.4.2 release [\#283](https://github.com/nubisproject/nubis-consul/issues/283)
- Tag v1.4.2 release [\#280](https://github.com/nubisproject/nubis-consul/issues/280)

**Merged pull requests:**

- Merge v1.4.2 release into develop. \[skip ci\] [\#285](https://github.com/nubisproject/nubis-consul/pull/285) ([tinnightcap](https://github.com/tinnightcap))
- Update CHANGELOG for v1.4.2 release \[skip ci\] [\#284](https://github.com/nubisproject/nubis-consul/pull/284) ([tinnightcap](https://github.com/tinnightcap))
- Update CHANGELOG for v1.4.2 release \[skip ci\] [\#281](https://github.com/nubisproject/nubis-consul/pull/281) ([tinnightcap](https://github.com/tinnightcap))
- Add nubis/builder/artifacts/AMIs.json to .gitignore [\#279](https://github.com/nubisproject/nubis-consul/pull/279) ([gozer](https://github.com/gozer))
- When consul has no peers, handle the 'null ' case as no peers too [\#277](https://github.com/nubisproject/nubis-consul/pull/277) ([gozer](https://github.com/gozer))

## [v1.4.1](https://github.com/nubisproject/nubis-consul/tree/v1.4.1) (2017-04-11)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.4.0...v1.4.1)

**Closed issues:**

- Use Consul's new ec2\_join to discover peers [\#268](https://github.com/nubisproject/nubis-consul/issues/268)
- Upgrade Consul to 0.7.5 [\#255](https://github.com/nubisproject/nubis-consul/issues/255)
- \[acl\] Lock down Prometheus KV/Services [\#216](https://github.com/nubisproject/nubis-consul/issues/216)
- Keep the list of servers up-to-date in the consul.\<env\>.\<region\>.\<account\>.nubis.allizom.org zone [\#164](https://github.com/nubisproject/nubis-consul/issues/164)
- Look into the possiblilty of keeping a DNS record with multiple A records that's [\#68](https://github.com/nubisproject/nubis-consul/issues/68)
- Tag v1.4.1 release [\#272](https://github.com/nubisproject/nubis-consul/issues/272)
- Tag v1.4.1 release [\#270](https://github.com/nubisproject/nubis-consul/issues/270)

**Merged pull requests:**

- Merge v1.4.1 release into develop. \[skip ci\] [\#274](https://github.com/nubisproject/nubis-consul/pull/274) ([tinnightcap](https://github.com/tinnightcap))
- Update CHANGELOG for v1.4.1 release \[skip ci\] [\#273](https://github.com/nubisproject/nubis-consul/pull/273) ([tinnightcap](https://github.com/tinnightcap))
- Update CHANGELOG for v1.4.1 release \[skip ci\] [\#271](https://github.com/nubisproject/nubis-consul/pull/271) ([tinnightcap](https://github.com/tinnightcap))
- Use Consul ec2\_join to try and find our peers [\#269](https://github.com/nubisproject/nubis-consul/pull/269) ([gozer](https://github.com/gozer))
- v1.4.0 fixups [\#267](https://github.com/nubisproject/nubis-consul/pull/267) ([gozer](https://github.com/gozer))

## [v1.4.0](https://github.com/nubisproject/nubis-consul/tree/v1.4.0) (2017-04-04)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.3.0...v1.4.0)

**Closed issues:**

- Disable detailled monitoring [\#259](https://github.com/nubisproject/nubis-consul/issues/259)
- Upgrade to Consul 0.7.5 [\#257](https://github.com/nubisproject/nubis-consul/issues/257)
- Add ec2:DescribeTags permission for EC2 peer discovery [\#251](https://github.com/nubisproject/nubis-consul/issues/251)
- Enable ASG metrics [\#249](https://github.com/nubisproject/nubis-consul/issues/249)
- Upgrade Consul to v0.7.3 [\#248](https://github.com/nubisproject/nubis-consul/issues/248)
- Upgrade to Consul 0.7.2 [\#244](https://github.com/nubisproject/nubis-consul/issues/244)
- Upgrade to Consul 0.7 [\#207](https://github.com/nubisproject/nubis-consul/issues/207)
- Tag v1.4.0 release [\#264](https://github.com/nubisproject/nubis-consul/issues/264)
- Tag v1.4.0 release [\#247](https://github.com/nubisproject/nubis-consul/issues/247)

**Merged pull requests:**

- Merge v1.4.0 release into develop. \[skip ci\] [\#266](https://github.com/nubisproject/nubis-consul/pull/266) ([tinnightcap](https://github.com/tinnightcap))
- Update CHANGELOG for v1.4.0 release \[skip ci\] [\#265](https://github.com/nubisproject/nubis-consul/pull/265) ([tinnightcap](https://github.com/tinnightcap))
- fix MiG bootstrap [\#263](https://github.com/nubisproject/nubis-consul/pull/263) ([gozer](https://github.com/gozer))
- Merge v1.4.0 release into develop. \[skip ci\] [\#262](https://github.com/nubisproject/nubis-consul/pull/262) ([tinnightcap](https://github.com/tinnightcap))
- Update CHANGELOG for v1.4.0 release \[skip ci\] [\#261](https://github.com/nubisproject/nubis-consul/pull/261) ([tinnightcap](https://github.com/tinnightcap))
- Disable EC2 detailled monitoring [\#260](https://github.com/nubisproject/nubis-consul/pull/260) ([gozer](https://github.com/gozer))
- Upgrade to Consul v0.7.5 [\#258](https://github.com/nubisproject/nubis-consul/pull/258) ([gozer](https://github.com/gozer))
- Update builder artifacts for v1.4.0 release \[skip ci\] [\#256](https://github.com/nubisproject/nubis-consul/pull/256) ([tinnightcap](https://github.com/tinnightcap))
- Terraform 0.8 Upgrade [\#254](https://github.com/nubisproject/nubis-consul/pull/254) ([gozer](https://github.com/gozer))
- Add some ASG metrics for monitoring [\#253](https://github.com/nubisproject/nubis-consul/pull/253) ([gozer](https://github.com/gozer))
- Add ec2:DescribeTags permission [\#252](https://github.com/nubisproject/nubis-consul/pull/252) ([gozer](https://github.com/gozer))
- Upgrade to Consul 0.7.3 [\#250](https://github.com/nubisproject/nubis-consul/pull/250) ([gozer](https://github.com/gozer))
- Update builder artifacts for v1.4.0-dev release [\#246](https://github.com/nubisproject/nubis-consul/pull/246) ([tinnightcap](https://github.com/tinnightcap))
- Upgrade to Consul 0.7.2 [\#245](https://github.com/nubisproject/nubis-consul/pull/245) ([gozer](https://github.com/gozer))

## [v1.3.0](https://github.com/nubisproject/nubis-consul/tree/v1.3.0) (2016-12-21)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.2.2...v1.3.0)

**Closed issues:**

- Use new consul snapshot command for backups [\#233](https://github.com/nubisproject/nubis-consul/issues/233)
- Upgrade to Consul 0.7.1 [\#232](https://github.com/nubisproject/nubis-consul/issues/232)
- \[ssl\] Public SSL cert should be verifiable and isn't [\#230](https://github.com/nubisproject/nubis-consul/issues/230)
- Inject userdata for user management [\#227](https://github.com/nubisproject/nubis-consul/issues/227)
- \[backup\] Store backups in S3 with a data-based prefix [\#226](https://github.com/nubisproject/nubis-consul/issues/226)
- Convert to unicreds from credstash [\#218](https://github.com/nubisproject/nubis-consul/issues/218)
- \[telemetry\] Use statsd\_exporter to bubble up more telemetry data [\#214](https://github.com/nubisproject/nubis-consul/issues/214)
- Upgrade to Consul 0.7.0 [\#210](https://github.com/nubisproject/nubis-consul/issues/210)
- Install consul\_exporter [\#208](https://github.com/nubisproject/nubis-consul/issues/208)
- Tag v1.2.3 release [\#204](https://github.com/nubisproject/nubis-consul/issues/204)
- \[cleanup\] Remove usage of AWS\_DEFAULT\_PROFILE [\#202](https://github.com/nubisproject/nubis-consul/issues/202)
- Split DNS entries publishing in 2 distinct zones, one for discovery, the other one for public access [\#162](https://github.com/nubisproject/nubis-consul/issues/162)
- Convert to using TLS provider for generating our Consul X509 Cert [\#133](https://github.com/nubisproject/nubis-consul/issues/133)
- Convert to CloudFormation [\#22](https://github.com/nubisproject/nubis-consul/issues/22)
- Tag v1.3.0 release [\#240](https://github.com/nubisproject/nubis-consul/issues/240)
- Update DataDog API key only if it changes [\#194](https://github.com/nubisproject/nubis-consul/issues/194)

**Merged pull requests:**

- Update CHANGELOG for v1.3.0 release [\#243](https://github.com/nubisproject/nubis-consul/pull/243) ([tinnightcap](https://github.com/tinnightcap))
- Update builder artifacts for v1.3.0 release [\#242](https://github.com/nubisproject/nubis-consul/pull/242) ([tinnightcap](https://github.com/tinnightcap))
- Add missing file [\#241](https://github.com/nubisproject/nubis-consul/pull/241) ([gozer](https://github.com/gozer))
- add nat/ as protected area of our Consul platform keyspace [\#239](https://github.com/nubisproject/nubis-consul/pull/239) ([gozer](https://github.com/gozer))
- Use consul snapshot \(new in 0.7\) to drive our backups [\#238](https://github.com/nubisproject/nubis-consul/pull/238) ([gozer](https://github.com/gozer))
- Fix Links [\#237](https://github.com/nubisproject/nubis-consul/pull/237) ([tinnightcap](https://github.com/tinnightcap))
- Update Documentation [\#236](https://github.com/nubisproject/nubis-consul/pull/236) ([tinnightcap](https://github.com/tinnightcap))
- use nubis-cron [\#235](https://github.com/nubisproject/nubis-consul/pull/235) ([gozer](https://github.com/gozer))
- Upgrade to Consul 0.7.1 [\#234](https://github.com/nubisproject/nubis-consul/pull/234) ([gozer](https://github.com/gozer))
- Make sure the public SSL cert is verifiyable [\#231](https://github.com/nubisproject/nubis-consul/pull/231) ([gozer](https://github.com/gozer))
- merge [\#229](https://github.com/nubisproject/nubis-consul/pull/229) ([gozer](https://github.com/gozer))
- Inject userdata into consul [\#228](https://github.com/nubisproject/nubis-consul/pull/228) ([limed](https://github.com/limed))
- Update background for redability [\#225](https://github.com/nubisproject/nubis-consul/pull/225) ([tinnightcap](https://github.com/tinnightcap))
- Change echo -n to just echo [\#224](https://github.com/nubisproject/nubis-consul/pull/224) ([gozer](https://github.com/gozer))
- Add deployment media and documentation [\#223](https://github.com/nubisproject/nubis-consul/pull/223) ([tinnightcap](https://github.com/tinnightcap))
- fix tyop [\#222](https://github.com/nubisproject/nubis-consul/pull/222) ([gozer](https://github.com/gozer))
- Fix issue with unicreds choking on key values starting with -- [\#221](https://github.com/nubisproject/nubis-consul/pull/221) ([gozer](https://github.com/gozer))
- Convert to unicreds for secret managment [\#219](https://github.com/nubisproject/nubis-consul/pull/219) ([gozer](https://github.com/gozer))
- Lock down KV space for prometheus as well as services:  - prometheus  - alertmanager  - grafana [\#217](https://github.com/nubisproject/nubis-consul/pull/217) ([gozer](https://github.com/gozer))
- Install and run statsd\_exporter and publish Consul metrics to it [\#215](https://github.com/nubisproject/nubis-consul/pull/215) ([gozer](https://github.com/gozer))
- Set the expected number of Consul servers in user-data [\#213](https://github.com/nubisproject/nubis-consul/pull/213) ([gozer](https://github.com/gozer))
- Enable nubis-travis v0.1.0 [\#212](https://github.com/nubisproject/nubis-consul/pull/212) ([gozer](https://github.com/gozer))
- Upgrade to Consul 0.7.0 [\#211](https://github.com/nubisproject/nubis-consul/pull/211) ([gozer](https://github.com/gozer))
- Install and enable consul\_exporter, when node\_exporter is enabled [\#209](https://github.com/nubisproject/nubis-consul/pull/209) ([gozer](https://github.com/gozer))
- Update builder artifacts for v1.3.0-dev release [\#206](https://github.com/nubisproject/nubis-consul/pull/206) ([gozer](https://github.com/gozer))
- Update builder artifacts for v1.2.3 release [\#205](https://github.com/nubisproject/nubis-consul/pull/205) ([gozer](https://github.com/gozer))
- Remove aws\_profile, we don't need it and don't use it anymore [\#203](https://github.com/nubisproject/nubis-consul/pull/203) ([gozer](https://github.com/gozer))
- Update DataDog API key only if it changed [\#195](https://github.com/nubisproject/nubis-consul/pull/195) ([gozer](https://github.com/gozer))

## [v1.2.2](https://github.com/nubisproject/nubis-consul/tree/v1.2.2) (2016-08-02)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.2.1...v1.2.2)

**Closed issues:**

- Tag v1.2.2 release [\#199](https://github.com/nubisproject/nubis-consul/issues/199)

**Merged pull requests:**

- Update CHANGELOG for v1.2.2 release [\#201](https://github.com/nubisproject/nubis-consul/pull/201) ([tinnightcap](https://github.com/tinnightcap))
- Update builder artifacts for v1.2.2 release [\#200](https://github.com/nubisproject/nubis-consul/pull/200) ([tinnightcap](https://github.com/tinnightcap))

## [v1.2.1](https://github.com/nubisproject/nubis-consul/tree/v1.2.1) (2016-07-30)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.2.0...v1.2.1)

**Closed issues:**

- Tag v1.2.1 release [\#196](https://github.com/nubisproject/nubis-consul/issues/196)

**Merged pull requests:**

- Update CHANGELOG for v1.2.1 release [\#198](https://github.com/nubisproject/nubis-consul/pull/198) ([tinnightcap](https://github.com/tinnightcap))
- Update builder artifacts for v1.2.1 release [\#197](https://github.com/nubisproject/nubis-consul/pull/197) ([tinnightcap](https://github.com/tinnightcap))
- Update builder artifacts for v1.3.0-dev release [\#192](https://github.com/nubisproject/nubis-consul/pull/192) ([tinnightcap](https://github.com/tinnightcap))

## [v1.2.0](https://github.com/nubisproject/nubis-consul/tree/v1.2.0) (2016-07-07)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.1.0...v1.2.0)

**Closed issues:**

- Tag v1.1.0 release [\#47](https://github.com/nubisproject/nubis-consul/issues/47)
- Tag v1.2.0 release [\#190](https://github.com/nubisproject/nubis-consul/issues/190)
- Missing Environment tags for instances [\#186](https://github.com/nubisproject/nubis-consul/issues/186)
- Terraform format [\#184](https://github.com/nubisproject/nubis-consul/issues/184)
- Enable versionning for our S3 buckets [\#182](https://github.com/nubisproject/nubis-consul/issues/182)

**Merged pull requests:**

- Update CHANGELOG for v1.2.0 release [\#191](https://github.com/nubisproject/nubis-consul/pull/191) ([tinnightcap](https://github.com/tinnightcap))
- Update builder artifacts for v1.2.0 release [\#189](https://github.com/nubisproject/nubis-consul/pull/189) ([tinnightcap](https://github.com/tinnightcap))
- Update builder artifacts for v1.2.0 release [\#188](https://github.com/nubisproject/nubis-consul/pull/188) ([tinnightcap](https://github.com/tinnightcap))
- Add missing Environment tag [\#187](https://github.com/nubisproject/nubis-consul/pull/187) ([gozer](https://github.com/gozer))
- terraform fmt [\#185](https://github.com/nubisproject/nubis-consul/pull/185) ([gozer](https://github.com/gozer))
- Enable versionning for our S3 buckets [\#183](https://github.com/nubisproject/nubis-consul/pull/183) ([gozer](https://github.com/gozer))

## [v1.1.0](https://github.com/nubisproject/nubis-consul/tree/v1.1.0) (2016-04-18)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.0.1...v1.1.0)

**Implemented enhancements:**

- Use paths in consul s3 backups [\#76](https://github.com/nubisproject/nubis-consul/issues/76)
- set leave\_on\_terminate = true [\#57](https://github.com/nubisproject/nubis-consul/issues/57)

**Fixed bugs:**

- Consul admin-ui 403 in v0.6.0 [\#101](https://github.com/nubisproject/nubis-consul/issues/101)

**Closed issues:**

- Create a multi-environment TF module [\#176](https://github.com/nubisproject/nubis-consul/issues/176)
- Ensure cron jobs that need the proxies get them. [\#174](https://github.com/nubisproject/nubis-consul/issues/174)
- Inject DataDog info if known [\#172](https://github.com/nubisproject/nubis-consul/issues/172)
- Notify that a Consul cluster has finished starting up in a client visible way [\#169](https://github.com/nubisproject/nubis-consul/issues/169)
- Race-condition in post-bootstrap actions [\#167](https://github.com/nubisproject/nubis-consul/issues/167)
- Upgrade to Consul 0.6.4 [\#165](https://github.com/nubisproject/nubis-consul/issues/165)
- Move to the v1.0.2-dev train [\#159](https://github.com/nubisproject/nubis-consul/issues/159)
- \[ACL\] environments/\* should be read-only for non-platform instances [\#157](https://github.com/nubisproject/nubis-consul/issues/157)
- Protect the nubis prefix with the platform ACL [\#155](https://github.com/nubisproject/nubis-consul/issues/155)
- let confd use the platform ACL token. [\#152](https://github.com/nubisproject/nubis-consul/issues/152)
- Upgrade to Consul 0.6.3 [\#151](https://github.com/nubisproject/nubis-consul/issues/151)
- Stop using self-signed cert for the internal endpoint [\#149](https://github.com/nubisproject/nubis-consul/issues/149)
- Fix curl/NSS issues with verifying our cert [\#147](https://github.com/nubisproject/nubis-consul/issues/147)
- Adapt to new nubis-secret that sets prefix by default [\#145](https://github.com/nubisproject/nubis-consul/issues/145)
- Restrict the anonymous ALC token out of the Platform namespaces [\#141](https://github.com/nubisproject/nubis-consul/issues/141)
- Publish Platform ACL into credstash [\#140](https://github.com/nubisproject/nubis-consul/issues/140)
- Create a platform ACL token at cluster startup [\#139](https://github.com/nubisproject/nubis-consul/issues/139)
- Protect the platform Consul access from the rest [\#138](https://github.com/nubisproject/nubis-consul/issues/138)
- Figure out IAM/KMS/DynamoDB permissionning to allow Consul to \*write\* to a [\#136](https://github.com/nubisproject/nubis-consul/issues/136)
- Public our UI SSL cert in credstash for others to retrieve [\#134](https://github.com/nubisproject/nubis-consul/issues/134)
- Upgrade to Consul 0.6.2 [\#129](https://github.com/nubisproject/nubis-consul/issues/129)
- \[Terraform\] aws\_autoscaling\_group.consul: "min\_elb\_capacity": \[DEPRECATED\] Please use 'wait\_for\_elb\_capacity' instead. [\#127](https://github.com/nubisproject/nubis-consul/issues/127)
- Remove nubis-secret, now that it's part of base since nubisproject/nubis-base\#275 [\#125](https://github.com/nubisproject/nubis-consul/issues/125)
- Switch over to the new nubis-base consul auto-join SKIP file [\#122](https://github.com/nubisproject/nubis-consul/issues/122)
- Allow Terraform to perform a rolling upgrade [\#121](https://github.com/nubisproject/nubis-consul/issues/121)
- Get rid of nubis/puppet/init.pp [\#117](https://github.com/nubisproject/nubis-consul/issues/117)
- Move credstash usage behind a wrapper [\#113](https://github.com/nubisproject/nubis-consul/issues/113)
- Move consul server startup code out of nubis-base nubis.d/00-consul [\#109](https://github.com/nubisproject/nubis-consul/issues/109)
- Downsize Consul instances to t2.nano [\#107](https://github.com/nubisproject/nubis-consul/issues/107)
- Upgrade to puppet 'KyleAnderson/consul' 1.0.5 [\#105](https://github.com/nubisproject/nubis-consul/issues/105)
- Convert to using TLS provider for generating our SSL certificates [\#104](https://github.com/nubisproject/nubis-consul/issues/104)
- Use credstash to bootstrap secrets [\#103](https://github.com/nubisproject/nubis-consul/issues/103)
- Upgrade to Consul v0.6.0 [\#99](https://github.com/nubisproject/nubis-consul/issues/99)
- ASG-join cronjob should intelligently join missing nodes instead of blindly joining [\#95](https://github.com/nubisproject/nubis-consul/issues/95)
- \[Datadog\] Enable Consul service checks [\#88](https://github.com/nubisproject/nubis-consul/issues/88)
- consul secret should be read from a file, to be consistent with the x509 inputs [\#80](https://github.com/nubisproject/nubis-consul/issues/80)
- Use ASG discovery to set bootstrap expect, possibly. [\#72](https://github.com/nubisproject/nubis-consul/issues/72)
- Consider using our ASG discovery to forcibly reap nodes that are not in the ASG anymore [\#69](https://github.com/nubisproject/nubis-consul/issues/69)
- Consider base64 encoding the SSL certs/keys before shoving them in Consul [\#53](https://github.com/nubisproject/nubis-consul/issues/53)
- Tag v1.0.2 release [\#98](https://github.com/nubisproject/nubis-consul/issues/98)

**Merged pull requests:**

- Update CHANGELOG for v1.1.0 release [\#181](https://github.com/nubisproject/nubis-consul/pull/181) ([tinnightcap](https://github.com/tinnightcap))
- Update builder artifacts for v1.1.0 release [\#180](https://github.com/nubisproject/nubis-consul/pull/180) ([tinnightcap](https://github.com/tinnightcap))
- Update versions for  release [\#179](https://github.com/nubisproject/nubis-consul/pull/179) ([tinnightcap](https://github.com/tinnightcap))
- Add multi-environment Consul TF module Take 2 [\#178](https://github.com/nubisproject/nubis-consul/pull/178) ([gozer](https://github.com/gozer))
- Use bash -l to make sure we load up /etc/profile.d scripts to pick up proxy setings [\#175](https://github.com/nubisproject/nubis-consul/pull/175) ([gozer](https://github.com/gozer))
- Default the DataDog API token from Credstash [\#173](https://github.com/nubisproject/nubis-consul/pull/173) ([gozer](https://github.com/gozer))
- Post to /consul-ready when we are done with our bootstrap, and protect that key [\#170](https://github.com/nubisproject/nubis-consul/pull/170) ([gozer](https://github.com/gozer))
- Move post bootstrap steps in its own script so it can be invoked with an exclusive lock [\#168](https://github.com/nubisproject/nubis-consul/pull/168) ([gozer](https://github.com/gozer))
- Upgrade Consul to 0.6.4 [\#166](https://github.com/nubisproject/nubis-consul/pull/166) ([gozer](https://github.com/gozer))
- small fixup [\#163](https://github.com/nubisproject/nubis-consul/pull/163) ([gozer](https://github.com/gozer))
- Switch over to v1.0.2-dev [\#161](https://github.com/nubisproject/nubis-consul/pull/161) ([gozer](https://github.com/gozer))
- make KV environments/ read-only for non-platform components [\#158](https://github.com/nubisproject/nubis-consul/pull/158) ([gozer](https://github.com/gozer))
- Add nubis as a protected platform ACL prefix [\#156](https://github.com/nubisproject/nubis-consul/pull/156) ([gozer](https://github.com/gozer))
- Add confd defaults to set CONSUL\_HTTP\_TOKEN in confd's environment, if we know of one [\#154](https://github.com/nubisproject/nubis-consul/pull/154) ([gozer](https://github.com/gozer))
- Upgrade to consul 0.6.3 [\#153](https://github.com/nubisproject/nubis-consul/pull/153) ([gozer](https://github.com/gozer))
- Turns out that we just needed to add the cert\_signing usage to the cert to make OpenSSL happy [\#150](https://github.com/nubisproject/nubis-consul/pull/150) ([gozer](https://github.com/gozer))
- Add the CA flag and disable the troublesome extension to our internal self-signed cert, so curl can happilly verify it. [\#148](https://github.com/nubisproject/nubis-consul/pull/148) ([gozer](https://github.com/gozer))
- Fix for new default nubis-secret prefix handling [\#146](https://github.com/nubisproject/nubis-consul/pull/146) ([gozer](https://github.com/gozer))
- /usr/local/bin PATH fixup [\#144](https://github.com/nubisproject/nubis-consul/pull/144) ([gozer](https://github.com/gozer))
- Publish the platform ACL into credstash at nubis/$ENV/consul/acl\_token [\#143](https://github.com/nubisproject/nubis-consul/pull/143) ([gozer](https://github.com/gozer))
- Automated Platform ACL creation [\#142](https://github.com/nubisproject/nubis-consul/pull/142) ([gozer](https://github.com/gozer))
- IAM Policy work to enable Consul servers to write to credstash, albeit in a limited way. [\#137](https://github.com/nubisproject/nubis-consul/pull/137) ([gozer](https://github.com/gozer))
- Place our UI SSL Cert \(self-signed\) to credstash [\#135](https://github.com/nubisproject/nubis-consul/pull/135) ([gozer](https://github.com/gozer))
- nubis-consul puppet module 1.0.5 has been released. [\#132](https://github.com/nubisproject/nubis-consul/pull/132) ([gozer](https://github.com/gozer))
- nubis-consul puppet module 1.0.5 has been released. [\#131](https://github.com/nubisproject/nubis-consul/pull/131) ([gozer](https://github.com/gozer))
- Upgrade to Consul v0.6.2 [\#130](https://github.com/nubisproject/nubis-consul/pull/130) ([gozer](https://github.com/gozer))
- Change Terraform variable min\_elb\_capacity to wait\_for\_elb\_capacity as of TF v0.6.9 [\#128](https://github.com/nubisproject/nubis-consul/pull/128) ([gozer](https://github.com/gozer))
- Remove nubis-secret, it's in base now [\#126](https://github.com/nubisproject/nubis-consul/pull/126) ([gozer](https://github.com/gozer))
- Switch over to /etc/consul/zzz-join.skip [\#124](https://github.com/nubisproject/nubis-consul/pull/124) ([gozer](https://github.com/gozer))
- Adopt Hashicorp's recommended way to perform rolling upgrades with Terraform [\#123](https://github.com/nubisproject/nubis-consul/pull/123) ([gozer](https://github.com/gozer))
- Prefix Consul backups with YYYY/MM/ prefix so they list nicer in the S3 bucket [\#120](https://github.com/nubisproject/nubis-consul/pull/120) ([gozer](https://github.com/gozer))
- Move puppet logic out of the deprecated init.pp [\#119](https://github.com/nubisproject/nubis-consul/pull/119) ([gozer](https://github.com/gozer))
- Hide the credstash handling to its own wrapper to hide it away [\#118](https://github.com/nubisproject/nubis-consul/pull/118) ([gozer](https://github.com/gozer))
- Determine our bootstrap quorum treshold from the size of our ASG [\#116](https://github.com/nubisproject/nubis-consul/pull/116) ([gozer](https://github.com/gozer))
- Be smart about ASG joining, and don't try and re-join with known peers [\#115](https://github.com/nubisproject/nubis-consul/pull/115) ([gozer](https://github.com/gozer))
- Enable datadog integration plugin, and ship Consul telemetry to DogStatsD [\#114](https://github.com/nubisproject/nubis-consul/pull/114) ([gozer](https://github.com/gozer))
- Ensure we don't auto-join anything, so create an empty config [\#112](https://github.com/nubisproject/nubis-consul/pull/112) ([gozer](https://github.com/gozer))
- Retrieve secrets from credstash, if not provided via user-data [\#111](https://github.com/nubisproject/nubis-consul/pull/111) ([gozer](https://github.com/gozer))
- Move all Consul server startup logic here, from nubis-base [\#110](https://github.com/nubisproject/nubis-consul/pull/110) ([gozer](https://github.com/gozer))
- Shrink down to t2.nano [\#108](https://github.com/nubisproject/nubis-consul/pull/108) ([gozer](https://github.com/gozer))
- Pin at a version of solarkennedy/puppet-consul that includes solarkennedy/puppet-consul\#208 [\#106](https://github.com/nubisproject/nubis-consul/pull/106) ([gozer](https://github.com/gozer))
- Monkey patch for upstream bug hashicorp/consul\#1071 [\#102](https://github.com/nubisproject/nubis-consul/pull/102) ([gozer](https://github.com/gozer))
- Upgrade to Consul v0.6.0 [\#100](https://github.com/nubisproject/nubis-consul/pull/100) ([gozer](https://github.com/gozer))

## [v1.0.1](https://github.com/nubisproject/nubis-consul/tree/v1.0.1) (2015-11-20)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v1.0.0...v1.0.1)

**Implemented enhancements:**

- Support multiple Consul clusters per account [\#71](https://github.com/nubisproject/nubis-consul/issues/71)
- Get rid of override.tf, now that we can split strings in Terraform [\#75](https://github.com/nubisproject/nubis-consul/pull/75) ([gozer](https://github.com/gozer))

**Closed issues:**

- Tag  release [\#91](https://github.com/nubisproject/nubis-consul/issues/91)
- Enable leave\_on\_terminate for saner, faster rolling upgrades [\#89](https://github.com/nubisproject/nubis-consul/issues/89)
- Tag v1.0.1 release [\#92](https://github.com/nubisproject/nubis-consul/issues/92)
- Hardcoded region [\#83](https://github.com/nubisproject/nubis-consul/issues/83)

**Merged pull requests:**

- Update CHANGELOG for v1.0.1 release [\#97](https://github.com/nubisproject/nubis-consul/pull/97) ([tinnightcap](https://github.com/tinnightcap))
- Update AMI IDs file for v1.0.1 release [\#96](https://github.com/nubisproject/nubis-consul/pull/96) ([tinnightcap](https://github.com/tinnightcap))
- Leftover cleanups [\#94](https://github.com/nubisproject/nubis-consul/pull/94) ([gozer](https://github.com/gozer))
- Enable leave\_on\_terminate [\#90](https://github.com/nubisproject/nubis-consul/pull/90) ([gozer](https://github.com/gozer))
- Remove hardcoded region value [\#84](https://github.com/nubisproject/nubis-consul/pull/84) ([limed](https://github.com/limed))

## [v1.0.0](https://github.com/nubisproject/nubis-consul/tree/v1.0.0) (2015-08-31)
[Full Changelog](https://github.com/nubisproject/nubis-consul/compare/v0.9.0...v1.0.0)

**Implemented enhancements:**

- Build support for ACL tokens [\#27](https://github.com/nubisproject/nubis-consul/issues/27)
- Replace bootstrap node with AWS ASG Discovery [\#21](https://github.com/nubisproject/nubis-consul/issues/21)

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
- Sanite override.tf file [\#52](https://github.com/nubisproject/nubis-consul/pull/52) ([limed](https://github.com/limed))
- Support for ACL Tokens [\#50](https://github.com/nubisproject/nubis-consul/pull/50) ([gozer](https://github.com/gozer))
- remove S3 work, shouldn't have made it to master [\#46](https://github.com/nubisproject/nubis-consul/pull/46) ([gozer](https://github.com/gozer))
- remove S3 work, shouldn't have made it to master [\#45](https://github.com/nubisproject/nubis-consul/pull/45) ([gozer](https://github.com/gozer))
- Issue 41 security group rename [\#42](https://github.com/nubisproject/nubis-consul/pull/42) ([limed](https://github.com/limed))
- Tfvars variable add [\#39](https://github.com/nubisproject/nubis-consul/pull/39) ([limed](https://github.com/limed))
- Readme updates [\#38](https://github.com/nubisproject/nubis-consul/pull/38) ([limed](https://github.com/limed))
- merge [\#36](https://github.com/nubisproject/nubis-consul/pull/36) ([gozer](https://github.com/gozer))
- Sanitize resource names to allow for rolling upgrades. Fixes \#29 [\#35](https://github.com/nubisproject/nubis-consul/pull/35) ([gozer](https://github.com/gozer))

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