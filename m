Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3101F09BD
	for <linux-m68k@lists.linux-m68k.org>; Sun, 25 May 2025 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748182857; cv=none; b=gIVA41HCv3mKGPaan47F9Yv61Hie9+lJG+Mus1DkQmfP9Co+xQuca3Qda00OPrFBqC/jsvg6NqqNG7me0LwUBWyXy2rnMNNrdlHDUdbptUfDP5IdeJexd276QWDjVKq7ekLMF8iHXINGE2syn0Fzi1K/ItDQOA4lr3cSErnqf8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748182857; c=relaxed/simple;
	bh=NkgnxlMGIw1zt4PsdRJpSwsO2DsZxBcE6frKDC2B7zE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NlSc+Mnx+I/0BryiyM5os0ln/WV5sPCG+KiqBRQH40AH1ZMfZhJK4jjcOirxSloeuqPQGrSbefLymuW5Fv5YGK4YVg+cJJCkpCYIdgutPAhUgRpniN36v/XL4TQdTZjRp/h26+GfBWiqoOBPzEE8cWQNUtPBgWHTIrfjK+f/zEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvMh95Rs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvMh95Rs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748182855; x=1779718855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NkgnxlMGIw1zt4PsdRJpSwsO2DsZxBcE6frKDC2B7zE=;
  b=AvMh95RssBhXtbP7s9Nc199pcGniRnwh9fb4c8+blD2/ZyTgx9kDbOkC
   3i1PoHt05xuqKpeY+6ZIXwq+MY8uFed5+oaMJAqABG/Kc/zMRsAjD+ofS
   EKlSqs7UD7padEPrwYtBSZutme1KLV1no+uPyNBKUVAcH5NkNTZMzYpm4
   kCF/tx/i9c+Ui2L4+MMmGgH4o4u2dQgL+/fpDN+yBdQ36ji7RoGdlni1K
   XUvRZfqA5vzR680Yg1IImecQMr/R4ZTJs3PQNgb7l2vjX6zAwkDLzypOY
   EL1BWpjaIPpotUYeZQZ6S0yoDzMz4NQ4t5twe6h2rTtKX/KZltlJWT5OF
   w==;
X-CSE-ConnectionGUID: 9A0T/0moQh2Sgb8QfkoYug==
X-CSE-MsgGUID: uppBfOwDSFiECCLUsZaZug==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50327315"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="50327315"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 07:20:54 -0700
X-CSE-ConnectionGUID: X/L7NLTbQY2UsSkljlpPLQ==
X-CSE-MsgGUID: YRO/uBAASpy26x8lE3UVYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="165170910"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 May 2025 07:20:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJCDa-000Rqe-1w;
	Sun, 25 May 2025 14:20:50 +0000
Date: Sun, 25 May 2025 22:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:atari-drm-wip-rebasing 17/17]
 drivers/gpu/drm/atari/atari_drm.c:3605: warning: Function parameter or
 struct member 'conn' not described in 'atari_drm_conn_mode_valid'
Message-ID: <202505252258.NK6eVqzV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git atari-drm-wip-rebasing
head:   c9e868e85b8e39710359f076a7c22c0659838e51
commit: c9e868e85b8e39710359f076a7c22c0659838e51 [17/17] drm: atari: Update to v6.15-rc1
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250525/202505252258.NK6eVqzV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505252258.NK6eVqzV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505252258.NK6eVqzV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/atari/atari_drm.c:3605: warning: Function parameter or struct member 'conn' not described in 'atari_drm_conn_mode_valid'
>> drivers/gpu/drm/atari/atari_drm.c:3605: warning: Function parameter or struct member 'mode' not described in 'atari_drm_conn_mode_valid'
>> drivers/gpu/drm/atari/atari_drm.c:3970: warning: Function parameter or struct member 'pipe' not described in 'atari_drm_pipe_mode_valid'
>> drivers/gpu/drm/atari/atari_drm.c:3970: warning: Function parameter or struct member 'mode' not described in 'atari_drm_pipe_mode_valid'
>> drivers/gpu/drm/atari/atari_drm.c:4019: warning: Function parameter or struct member 'crtc' not described in 'atari_drm_pipe_mode_fixup'
>> drivers/gpu/drm/atari/atari_drm.c:4019: warning: Function parameter or struct member 'mode' not described in 'atari_drm_pipe_mode_fixup'
>> drivers/gpu/drm/atari/atari_drm.c:4019: warning: Function parameter or struct member 'adjusted_mode' not described in 'atari_drm_pipe_mode_fixup'


vim +3605 drivers/gpu/drm/atari/atari_drm.c

14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3568  
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3569  /**
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3570   * atari_drm_conn_mode_valid
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3571   *
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3572   * Callback to validate a mode for a connector, irrespective of the
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3573   * specific display configuration.
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3574   *
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3575   * This callback is used by the probe helpers to filter the mode list
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3576   * (which is usually derived from the EDID data block from the sink).
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3577   * See e.g. drm_helper_probe_single_connector_modes().
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3578   *
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3579   * This function is optional.
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3580   *
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3581   * NOTE:
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3582   *
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3583   * This only filters the mode list supplied to userspace in the
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3584   * GETCONNECTOR IOCTL. Compared to &drm_encoder_helper_funcs.mode_valid,
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3585   * &drm_crtc_helper_funcs.mode_valid and &drm_bridge_funcs.mode_valid,
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3586   * which are also called by the atomic helpers from
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3587   * drm_atomic_helper_check_modeset(). This allows userspace to force and
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3588   * ignore sink constraint (like the pixel clock limits in the screen's
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3589   * EDID), which is useful for e.g. testing, or working around a broken
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3590   * EDID. Any source hardware constraint (which always need to be
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3591   * enforced) therefore should be checked in one of the above callbacks,
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3592   * and not this one here.
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3593   *
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3594   * To avoid races with concurrent connector state updates, the helper
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3595   * libraries always call this with the &drm_mode_config.connection_mutex
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3596   * held. Because of this it's safe to inspect &drm_connector->state.
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3597   *
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3598   * RETURNS:
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3599   *
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3600   * Either &drm_mode_status.MODE_OK or one of the failure reasons in &enum
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3601   * drm_mode_status.
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3602   */
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3603  static enum drm_mode_status atari_drm_conn_mode_valid(
c9e868e85b8e39 drivers/gpu/drm/atari/atari_drm.c Geert Uytterhoeven 2025-03-31  3604  	struct drm_connector *conn, const struct drm_display_mode *mode)
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02 @3605  {
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3606  	// FIXME
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3607  	return MODE_OK;
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3608  }
14323db4a7a707 drivers/gpu/drm/tiny/atari_drm.c  Geert Uytterhoeven 2020-11-02  3609  

:::::: The code at line 3605 was first introduced by commit
:::::: 14323db4a7a7073486cbf0fda8f8a7a31ae822d2 drm: atari: Add a DRM driver for Atari graphics hardware

:::::: TO: Geert Uytterhoeven <geert@linux-m68k.org>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
