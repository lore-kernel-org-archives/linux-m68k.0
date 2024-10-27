Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16E51DA4E
	for <linux-m68k@vger.kernel.org>; Sun, 27 Oct 2024 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730033978; cv=none; b=HCO9UVSDL51L8SfQCXyf/m53DKKePTebjp0f7bBv06OiLZ2vVVNpLgpAhqIuh4v1MdYvR4IXHULObanfEUtyRqRgfKJ/pq7rs/AFy0Bx28hwXozSFvpMybDDeJ7z8Qx5A+a9fCIiaT2IyopTIRzNRHSD6vTcYJtUD9Obpykyxlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730033978; c=relaxed/simple;
	bh=PfFxUYGchy9U5nfUO8Zu86KFxajZqbM+rlaiLs5X2OY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WHTAkDlNnSYGSZBLs8BroHk957F/jcUqdaEx320CxW7fF2YLZLW63AbQR2uws5rrf/IagCzFJ/Vamn+PlcNQdBYeHCUZ7E3tAYy/M6sg9VTRImqC9YrNif16o2FUrytF0GzRwRHstGfcjtxcM8ReVzPvkXBmmMcsYwD7K0l6R+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=GxP0IW8i; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nQtCWeJ6; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="GxP0IW8i";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nQtCWeJ6"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5CC3611400E4;
	Sun, 27 Oct 2024 08:59:32 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sun, 27 Oct 2024 08:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730033972;
	 x=1730120372; bh=juvx/OF7Nq9R5F2nx8AY4Mp0w1zBzQn0xVpl6bTdNTE=; b=
	GxP0IW8in1nmCXqbG05o5usglfFCTCl5/t2L4A0qEMNPCzWUn/oif8pG/RPsKR9H
	s7qMneTqiK7mJpM8JtSkb9r7RyiF6BunTH6qMa3DkNjYefH6ApzQ7wnrMCUyxLlQ
	j9dSLwOFZSM+EBufiEMPywuPmedjiPCqa72TlYFOZPBP2NLnS+OcQnOrK1abNTvg
	4LZluT7avLPsJIQ2v5IhDyZfDUq/iWEFJAGmnV6UMJhzCO2WRcy4ycp6v0ktR+2p
	BvoUqNpPwkN1GAhO4AOVG8XGxeKOtbwCWH96pig914/dW5QN4Jn5biSMtIGqpOr6
	x4y17NmAfL4p3V6lp3Risw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730033972; x=
	1730120372; bh=juvx/OF7Nq9R5F2nx8AY4Mp0w1zBzQn0xVpl6bTdNTE=; b=n
	QtCWeJ6dr5KJNfTi4Cl3zXSEyd2ppBMeJef9XVztaK/QikkUSk8pWrBW/gvTWIZx
	ecbepwprysGvmGTd39YH+4VrOe0zaXbllg+x1PVVMAjdc7p0Z7VHR60XkckKLhc5
	Yflg3Dka/Ysx67XORjZsmXrk2/rm4cVEcN/jrtSCeLJojblaQ/33oCmsR978w4ux
	aGKoiOsPQaAif2gw4VdoyamNWGV/AN3fIzBS9GwNmWvwnxkAZGdfKPX+FCcKKpHk
	lGXoc7NMEph3uBPsJAOIBIMH+9D5Ct0qdiW/ZA9pc9CDA7e2YVEARzHd4qGhBq5A
	EynLuqO2dm9R9aPmQXP1Q==
X-ME-Sender: <xms:MzkeZw4oJ6-VbSxtyBBpzMG5ynno-G2DlYh2gsMuBErb8yg-byJOTw>
    <xme:MzkeZx6-hhozd_4sCX_rdgztbTKtEEbnz3DONeg8ToXqpemS69f93PzqvODPkxaZT
    qqVtfZAo6MrLp7kpr0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejiedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlih
    hnvgdrtghordhukhdprhgtphhtthhopehtghesuggvsghirghnrdhorhhgpdhrtghpthht
    ohepshgrmhesghgvnhhtohhordhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugi
    dqmheikehkrdhorhhgpdhrtghpthhtohepshgthhifrggssehlihhnuhigqdhmieekkhdr
    ohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrd
    horhhgpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhuqdgsvghrlhhi
    nhdruggvpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:MzkeZ_c-NpljHQZFf44wuzzHrXfdoL0rg3CXaM7ATJ-7-dnoMTL5uQ>
    <xmx:MzkeZ1IlQnvObloYHx1Qy9FjXV04aR2Znw45bsVf0GxQIC74utjmpg>
    <xmx:MzkeZ0JUjajwI0gMrmaYalQVzDjTgum8fjkrfhLi6Nbu_AHxxU-j2g>
    <xmx:MzkeZ2zInidWyq7wCbnYFRHkKFoyTEJ-i68UovmAe3QeAf50Crc5LA>
    <xmx:NDkeZ9oLtCHXOspFF5jjTg-1pZ31PJ8X0k3ujpuWNLWhb9G3XQWRjBzX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 205FA2220071; Sun, 27 Oct 2024 08:59:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 27 Oct 2024 12:58:45 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Schwab" <schwab@linux-m68k.org>,
 "Thorsten Glaser" <tg@debian.org>
Cc: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 linux-m68k <linux-m68k@vger.kernel.org>,
 debian-68k <debian-68k@lists.debian.org>,
 "James Le Cuirot" <chewi@aura-online.co.uk>, "Sam James" <sam@gentoo.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Message-Id: <99a649a3-9467-422b-bf86-2712ea00912e@app.fastmail.com>
In-Reply-To: <874j4z253e.fsf@igel.home>
References: 
 <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
 <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
 <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de> <874j4z253e.fsf@igel.home>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 25, 2024, at 22:24, Andreas Schwab wrote:
> On Okt 25 2024, Thorsten Glaser wrote:
>
>> Question is, do we need a kernel change for this at all?
>> Is there anything in the kernel/userland interface that
>> gets affected by this, or do these APIs use sufficient
>> explicit padding? Has anyone looked at this?
>
> Already basic things like struct stat64 will break.

I tried writing a small script that compiles each exported
kernel header in order to get the debugging data for struct
definitions. This is the list of the 236 structures that
pahole reports being different with -malign-int. I probably
missed a small number in header files that failed to build
standalone, but this covers most.

I think it makes sense to go through these anyway and annotate
them to document and enforce the alignment we actually want
regardless of -malign-int, either by adding architecture
specific __packed/__aligned attributes, or by adding explicit
padding. If all of them get fixed alignment, this would allow
switching -malign-int on independently for userspace and
kernel without changing the ABI. Any duplicated copies of
the struct definitions in userspace of course would need
the same changes.

      Arnd

---
 struct _IOCTL_Command_struct {
 struct _MGSL_PARAMS {
 struct __fat_dirent {
 struct __old_kernel_stat {
 struct acrn_cstate_data {
 struct acrn_pcidev {
 struct atm_backend_ppp {
 struct atm_qos {
 struct atm_trafprm {
 struct atmlec_config_msg {
 struct atmlec_ioc {
 struct atmlec_msg {
 struct atmsvc_msg {
 struct atmtcp_control {
 struct ax25_ctl_struct {
 struct ax25_route_opt_struct {
 struct blk_user_trace_setup {
 struct bpf_perf_event_data {
 struct bpq_req {
 struct br_mdb_entry {
 struct br_mrp_in_role {
 struct br_mrp_in_state {
 struct br_mrp_instance {
 struct br_mrp_start_in_test {
 struct br_port_msg {
 struct btrfs_ioctl_dev_replace_args {
 struct btrfs_ioctl_dev_replace_start_par
 struct cdrom_blk {
 struct cdrom_generic_command {
 struct cdrom_multisession {
 struct cdrom_read_audio {
 struct cdrom_subchnl {
 struct cdrom_tocentry {
 struct cycx_firmware {
 struct cycx_fw_info {
 struct dlm_lksb {
 struct dlm_lock_result {
 struct drm_etnaviv_pm_signal {
 struct dvb_diseqc_slave_reply {
 struct dvd_bca {
 struct dvd_lu_send_title_key {
 struct dvd_manufact {
 struct dvd_physical {
 struct ebt_arp_info {
 struct ebt_arpreply_info {
 struct ebt_mark_m_info {
 struct ebt_nat_info {
 struct ebt_stp_config_info {
 struct ebt_stp_info {
 struct edd {
 struct efs_super {
 struct eg_ctrl_info {
 struct ethtool_ah_espip4_spec {
 struct ethtool_ah_espip6_spec {
 struct ethtool_rx_ntuple_flow_spec {
 struct ethtool_tcpip4_spec {
 struct ethtool_tcpip6_spec {
 struct ethtool_usrip6_spec {
 struct ethtool_wolinfo {
 struct fat_boot_sector {
 struct fb_cursor {
 struct fb_fix_screeninfo {
 struct fb_image {
 struct floppy_drive_params {
 struct floppy_fdc_state {
 struct fs_quota_stat {
 struct full_sockaddr_ax25 {
 struct full_sockaddr_rose {
 struct hdr_output_metadata {
 struct hdsp_config_info {
 struct hdsp_version {
 struct hdspm_peak_rms {
 struct hdspm_status {
 struct hdspm_version {
 struct he_ioctl_reg {
 struct hiddev_devinfo {
 struct hv_kvp_msg {
 struct i2c_msg {
 struct i2c_smbus_ioctl_data {
 struct i2o_sw_xfer {
 struct idmap_msg {
 struct ieee_pfc {
 struct ifla_vf_vlan_info {
 struct in_ctrl_info {
 struct inet_diag_hostcond {
 struct ip6t_ah {
 struct ip6t_frag {
 struct ip6t_rt {
 struct ip6t_srh1 {
 struct ip_set_counter_match0 {
 struct ip_vs_dest_entry {
 struct ip_vs_dest_user {
 struct ip_vs_get_dests {
 struct ip_vs_service_entry {
 struct ip_vs_service_user {
 struct ipmi_addr {
 struct ipmi_ipmb_direct_addr {
 struct ipmi_ssif_msg {
 struct ipt_ah {
 struct ipt_clusterip_tgt_info {
 struct j1939_filter {
 struct k_message {
 struct loop_info {
 struct media_link_desc {
 struct media_pad_desc {
 struct mf6cctl {
 struct mfcctl {
 struct mif6ctl {
 struct msgbuf {
 struct msginfo {
 struct msqid_ds {
 struct mtd_info_user {
 struct mtop {
 struct nd_papr_pdsm_health {
 struct nd_papr_pdsm_smart_inject {
 struct nf_nat_range2 {
 struct nfs_mount_data {
 struct nr_route_struct {
 struct opal_geometry {
 struct ovs_action_push_mpls {
 struct ovs_key_arp {
 struct ovs_key_ct_tuple_ipv4 {
 struct ovs_key_ct_tuple_ipv6 {
 struct pci_endpoint_test_xfer_param {
 struct pg_read_hdr {
 struct pg_write_hdr {
 struct plipconf {
 struct pt_regs {
 struct ptrace_syscall_info {
 struct qedr_create_qp_uresp {
 struct rds6_info_rdma_connection {
 struct rds_info_rdma_connection {
 struct rio_rdev_info {
 struct rkisp1_cif_isp_afc_config {
 struct rkisp1_cif_isp_dpf_config {
 struct rkisp1_cif_isp_dpf_nll {
 struct rkisp1_cif_isp_isp_meas_cfg {
 struct rkisp1_cif_isp_isp_other_cfg {
 struct rkisp1_cif_isp_sdg_config {
 struct rkisp1_cif_isp_stat {
 struct rkisp1_ext_params_afc_config {
 struct rkisp1_ext_params_dpf_config {
 struct rkisp1_ext_params_sdg_config {
 struct rkisp1_params_cfg {
 struct rkisp1_stat_buffer {
 struct rose_facilities_struct {
 struct rtc_wkalrm {
 struct scc_calibrate {
 struct scc_modem {
 struct scom_access {
 struct semid_ds {
 struct serial_multiport_struct {
 struct serial_struct {
 struct sigcontext {
 struct sioc_mif_req6 {
 struct sioc_vif_req {
 struct sisfb_info {
 struct snd_dm_fm_note {
 struct snd_emu10k1_fx8010_pcm_rec {
 struct snd_sb_csp_info {
 struct snp_guest_request_ioctl {
 struct sock_fprog {
 struct sockaddr_atmpvc {
 struct sockaddr_atmsvc {
 struct sockaddr_ax25 {
 struct sockaddr_caif {
 struct sockaddr_can {
 struct sockaddr_nfc {
 struct sockaddr_nfc_llcp {
 struct sockaddr_qrtr {
 struct sockaddr_rose {
 struct stat64 {
 struct taskstats {
 struct tc_connmark {
 struct tc_ife {
 struct tc_pedit_sel {
 struct unimapdesc {
 struct usb_raw_ep_info {
 struct usb_raw_eps_info {
 struct usbdevfs_connectinfo {
 struct usbdevfs_urb {
 struct uvc_xu_control_query {
 struct uvesafb_task {
 struct vbg_ioctl_log {
 struct vduse_iotlb_entry {
 struct vduse_vq_info {
 struct vfio_device_info_cap_zpci_group {
 struct virtio_net_hash_config {
 struct virtio_net_rss_config {
 struct vlan_ioctl_args {
 struct xfrm_encap_tmpl {
 struct xfrm_selector {
 struct xfrm_user_acquire {
 struct xfrm_user_expire {
 struct xfrm_user_kmaddress {
 struct xfrm_user_offload {
 struct xfrm_user_polexpire {
 struct xfrm_user_report {
 struct xfrm_userpolicy_id {
 struct xfrm_userpolicy_info {
 struct xfrm_usersa_info {
 struct xfrm_userspi_info {
 struct xsdfec_ldpc_params {
 struct xsdfec_status {
 struct xsdfec_turbo {
 struct xt_bpf_info {
 struct xt_connmark_mtinfo1 {
 struct xt_connmark_tginfo1 {
 struct xt_conntrack_mtinfo2 {
 struct xt_conntrack_mtinfo3 {
 struct xt_entry_match {
 struct xt_entry_target {
 struct xt_error_target {
 struct xt_esp {
 struct xt_helper_info {
 struct xt_hmark_info {
 struct xt_ipcomp {
 struct xt_iprange_mtinfo {
 struct xt_mac_info {
 struct xt_mark_mtinfo1 {
 struct xt_owner_match_info {
 struct xt_realm_info {
 struct xt_secmark_target_info {
 struct xt_secmark_target_info_v1 {
 struct xt_set_info_match_v0 {
 struct xt_set_info_match_v3 {
 struct xt_set_info_target_v0 {
 struct xt_set_info_v0 {
 struct xt_time_info {
 struct xt_tproxy_target_info {
 struct xt_tproxy_target_info_v1 {
 struct xt_u32 {
 struct xt_u32_location_element {
 struct xt_u32_test {
 union __sifields {
 union ethtool_flow_union {
