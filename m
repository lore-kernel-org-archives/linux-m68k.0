Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AA31DC06D
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102252; cv=none; b=Rkzg5c8AA9HBLeT7iUlEwvN+fUkmGM56TyzscZrLvOxyBKhNCPwxuiELayAR723EQ7JlLFLaSgRtQjHH3CeZkGiPp94c5eDqsRCvoMViIKwOY8Py3LuB6ytfZBiuzFD1pDb7PUIjs9nz0xz+r+UYv560EGBv+sFluuHUve5jHpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102252; c=relaxed/simple;
	bh=5R2kOI0S8gzjfKAFBMkHytavtmmSkCKYSkA0yM90FiQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dhW2G1625jGOti+nFFRv0jlBecwZURYuvJj/qfFLpO6WPINVia3wRa3X1v902DiilsiDFPbnAOhYzJEjPn8ahwEBSXlGg7zwxR8mZ1tFriM3lEADhVFdU5CoPQtWcqs60rM7TTtOYVECcPd0H1iIlL1vJ3wsFxVt8DE9bibZnzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=K9DLtPkE; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="K9DLtPkE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zm5nDmPG6xZWnHP3mHauVlj+u2P6vdnKQ82LUR3oxZ8=; t=1730102249; x=1730707049; 
	b=K9DLtPkEZiWiyc/P1EDua6usEKXT28vyyj/t0T2d8217BwJ/3xJltVl8fkuWdrGKqmFBVApgwq1
	s9hUQM4SRkeenOUeQV8l1bCrv3thBRqoaQABH94H0ZdEQ6LokSTCZVyuWE2ffh9DrafvhOwB8cT55
	Du/wZuEYT8ucoMKLXHtwmdrStFeyuqFaAt7aeoPNZg8SubVDVyltUzDYFS/oRo3S5buhEMq92Yibd
	qfH7tZuK5W6fPMfqAHpMazx3kRj2RRwRziNZxrC/EYJX4GI2pYKDdJO8tsa29H1G7+OrtlXXYWwfa
	Quhyw3rt9TA1+UXMJWyoMukdNWBwpQBrsmRw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5Kcy-000000049i8-0S9c; Mon, 28 Oct 2024 08:57:28 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5Kcx-00000002Bpy-3iQD; Mon, 28 Oct 2024 08:57:28 +0100
Message-ID: <daa7d9cd562a2b995d57284de343ed7bafdad1f8.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Arnd Bergmann <arnd@arndb.de>, Andreas Schwab <schwab@linux-m68k.org>, 
 Thorsten Glaser
	 <tg@debian.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k
	 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Oct 2024 08:57:27 +0100
In-Reply-To: <99a649a3-9467-422b-bf86-2712ea00912e@app.fastmail.com>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
	 <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
	 <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de> <874j4z253e.fsf@igel.home>
	 <99a649a3-9467-422b-bf86-2712ea00912e@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello Arnd,

On Sun, 2024-10-27 at 12:58 +0000, Arnd Bergmann wrote:
> On Fri, Oct 25, 2024, at 22:24, Andreas Schwab wrote:
> > On Okt 25 2024, Thorsten Glaser wrote:
> >=20
> > > Question is, do we need a kernel change for this at all?
> > > Is there anything in the kernel/userland interface that
> > > gets affected by this, or do these APIs use sufficient
> > > explicit padding? Has anyone looked at this?
> >=20
> > Already basic things like struct stat64 will break.
>=20
> I tried writing a small script that compiles each exported
> kernel header in order to get the debugging data for struct
> definitions. This is the list of the 236 structures that
> pahole reports being different with -malign-int. I probably
> missed a small number in header files that failed to build
> standalone, but this covers most.
>=20
> I think it makes sense to go through these anyway and annotate
> them to document and enforce the alignment we actually want
> regardless of -malign-int, either by adding architecture
> specific __packed/__aligned attributes, or by adding explicit
> padding. If all of them get fixed alignment, this would allow
> switching -malign-int on independently for userspace and
> kernel without changing the ABI. Any duplicated copies of
> the struct definitions in userspace of course would need
> the same changes.

Thanks a lot! This is a very constructive contribution to the discussion.

I will create a page on the Debian (or Gentoo) Wiki to collect such informa=
tion.

Adrian

> ---
>  struct _IOCTL_Command_struct {
>  struct _MGSL_PARAMS {
>  struct __fat_dirent {
>  struct __old_kernel_stat {
>  struct acrn_cstate_data {
>  struct acrn_pcidev {
>  struct atm_backend_ppp {
>  struct atm_qos {
>  struct atm_trafprm {
>  struct atmlec_config_msg {
>  struct atmlec_ioc {
>  struct atmlec_msg {
>  struct atmsvc_msg {
>  struct atmtcp_control {
>  struct ax25_ctl_struct {
>  struct ax25_route_opt_struct {
>  struct blk_user_trace_setup {
>  struct bpf_perf_event_data {
>  struct bpq_req {
>  struct br_mdb_entry {
>  struct br_mrp_in_role {
>  struct br_mrp_in_state {
>  struct br_mrp_instance {
>  struct br_mrp_start_in_test {
>  struct br_port_msg {
>  struct btrfs_ioctl_dev_replace_args {
>  struct btrfs_ioctl_dev_replace_start_par
>  struct cdrom_blk {
>  struct cdrom_generic_command {
>  struct cdrom_multisession {
>  struct cdrom_read_audio {
>  struct cdrom_subchnl {
>  struct cdrom_tocentry {
>  struct cycx_firmware {
>  struct cycx_fw_info {
>  struct dlm_lksb {
>  struct dlm_lock_result {
>  struct drm_etnaviv_pm_signal {
>  struct dvb_diseqc_slave_reply {
>  struct dvd_bca {
>  struct dvd_lu_send_title_key {
>  struct dvd_manufact {
>  struct dvd_physical {
>  struct ebt_arp_info {
>  struct ebt_arpreply_info {
>  struct ebt_mark_m_info {
>  struct ebt_nat_info {
>  struct ebt_stp_config_info {
>  struct ebt_stp_info {
>  struct edd {
>  struct efs_super {
>  struct eg_ctrl_info {
>  struct ethtool_ah_espip4_spec {
>  struct ethtool_ah_espip6_spec {
>  struct ethtool_rx_ntuple_flow_spec {
>  struct ethtool_tcpip4_spec {
>  struct ethtool_tcpip6_spec {
>  struct ethtool_usrip6_spec {
>  struct ethtool_wolinfo {
>  struct fat_boot_sector {
>  struct fb_cursor {
>  struct fb_fix_screeninfo {
>  struct fb_image {
>  struct floppy_drive_params {
>  struct floppy_fdc_state {
>  struct fs_quota_stat {
>  struct full_sockaddr_ax25 {
>  struct full_sockaddr_rose {
>  struct hdr_output_metadata {
>  struct hdsp_config_info {
>  struct hdsp_version {
>  struct hdspm_peak_rms {
>  struct hdspm_status {
>  struct hdspm_version {
>  struct he_ioctl_reg {
>  struct hiddev_devinfo {
>  struct hv_kvp_msg {
>  struct i2c_msg {
>  struct i2c_smbus_ioctl_data {
>  struct i2o_sw_xfer {
>  struct idmap_msg {
>  struct ieee_pfc {
>  struct ifla_vf_vlan_info {
>  struct in_ctrl_info {
>  struct inet_diag_hostcond {
>  struct ip6t_ah {
>  struct ip6t_frag {
>  struct ip6t_rt {
>  struct ip6t_srh1 {
>  struct ip_set_counter_match0 {
>  struct ip_vs_dest_entry {
>  struct ip_vs_dest_user {
>  struct ip_vs_get_dests {
>  struct ip_vs_service_entry {
>  struct ip_vs_service_user {
>  struct ipmi_addr {
>  struct ipmi_ipmb_direct_addr {
>  struct ipmi_ssif_msg {
>  struct ipt_ah {
>  struct ipt_clusterip_tgt_info {
>  struct j1939_filter {
>  struct k_message {
>  struct loop_info {
>  struct media_link_desc {
>  struct media_pad_desc {
>  struct mf6cctl {
>  struct mfcctl {
>  struct mif6ctl {
>  struct msgbuf {
>  struct msginfo {
>  struct msqid_ds {
>  struct mtd_info_user {
>  struct mtop {
>  struct nd_papr_pdsm_health {
>  struct nd_papr_pdsm_smart_inject {
>  struct nf_nat_range2 {
>  struct nfs_mount_data {
>  struct nr_route_struct {
>  struct opal_geometry {
>  struct ovs_action_push_mpls {
>  struct ovs_key_arp {
>  struct ovs_key_ct_tuple_ipv4 {
>  struct ovs_key_ct_tuple_ipv6 {
>  struct pci_endpoint_test_xfer_param {
>  struct pg_read_hdr {
>  struct pg_write_hdr {
>  struct plipconf {
>  struct pt_regs {
>  struct ptrace_syscall_info {
>  struct qedr_create_qp_uresp {
>  struct rds6_info_rdma_connection {
>  struct rds_info_rdma_connection {
>  struct rio_rdev_info {
>  struct rkisp1_cif_isp_afc_config {
>  struct rkisp1_cif_isp_dpf_config {
>  struct rkisp1_cif_isp_dpf_nll {
>  struct rkisp1_cif_isp_isp_meas_cfg {
>  struct rkisp1_cif_isp_isp_other_cfg {
>  struct rkisp1_cif_isp_sdg_config {
>  struct rkisp1_cif_isp_stat {
>  struct rkisp1_ext_params_afc_config {
>  struct rkisp1_ext_params_dpf_config {
>  struct rkisp1_ext_params_sdg_config {
>  struct rkisp1_params_cfg {
>  struct rkisp1_stat_buffer {
>  struct rose_facilities_struct {
>  struct rtc_wkalrm {
>  struct scc_calibrate {
>  struct scc_modem {
>  struct scom_access {
>  struct semid_ds {
>  struct serial_multiport_struct {
>  struct serial_struct {
>  struct sigcontext {
>  struct sioc_mif_req6 {
>  struct sioc_vif_req {
>  struct sisfb_info {
>  struct snd_dm_fm_note {
>  struct snd_emu10k1_fx8010_pcm_rec {
>  struct snd_sb_csp_info {
>  struct snp_guest_request_ioctl {
>  struct sock_fprog {
>  struct sockaddr_atmpvc {
>  struct sockaddr_atmsvc {
>  struct sockaddr_ax25 {
>  struct sockaddr_caif {
>  struct sockaddr_can {
>  struct sockaddr_nfc {
>  struct sockaddr_nfc_llcp {
>  struct sockaddr_qrtr {
>  struct sockaddr_rose {
>  struct stat64 {
>  struct taskstats {
>  struct tc_connmark {
>  struct tc_ife {
>  struct tc_pedit_sel {
>  struct unimapdesc {
>  struct usb_raw_ep_info {
>  struct usb_raw_eps_info {
>  struct usbdevfs_connectinfo {
>  struct usbdevfs_urb {
>  struct uvc_xu_control_query {
>  struct uvesafb_task {
>  struct vbg_ioctl_log {
>  struct vduse_iotlb_entry {
>  struct vduse_vq_info {
>  struct vfio_device_info_cap_zpci_group {
>  struct virtio_net_hash_config {
>  struct virtio_net_rss_config {
>  struct vlan_ioctl_args {
>  struct xfrm_encap_tmpl {
>  struct xfrm_selector {
>  struct xfrm_user_acquire {
>  struct xfrm_user_expire {
>  struct xfrm_user_kmaddress {
>  struct xfrm_user_offload {
>  struct xfrm_user_polexpire {
>  struct xfrm_user_report {
>  struct xfrm_userpolicy_id {
>  struct xfrm_userpolicy_info {
>  struct xfrm_usersa_info {
>  struct xfrm_userspi_info {
>  struct xsdfec_ldpc_params {
>  struct xsdfec_status {
>  struct xsdfec_turbo {
>  struct xt_bpf_info {
>  struct xt_connmark_mtinfo1 {
>  struct xt_connmark_tginfo1 {
>  struct xt_conntrack_mtinfo2 {
>  struct xt_conntrack_mtinfo3 {
>  struct xt_entry_match {
>  struct xt_entry_target {
>  struct xt_error_target {
>  struct xt_esp {
>  struct xt_helper_info {
>  struct xt_hmark_info {
>  struct xt_ipcomp {
>  struct xt_iprange_mtinfo {
>  struct xt_mac_info {
>  struct xt_mark_mtinfo1 {
>  struct xt_owner_match_info {
>  struct xt_realm_info {
>  struct xt_secmark_target_info {
>  struct xt_secmark_target_info_v1 {
>  struct xt_set_info_match_v0 {
>  struct xt_set_info_match_v3 {
>  struct xt_set_info_target_v0 {
>  struct xt_set_info_v0 {
>  struct xt_time_info {
>  struct xt_tproxy_target_info {
>  struct xt_tproxy_target_info_v1 {
>  struct xt_u32 {
>  struct xt_u32_location_element {
>  struct xt_u32_test {
>  union __sifields {
>  union ethtool_flow_union {

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
