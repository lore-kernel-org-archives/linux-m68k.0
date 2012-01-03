From: sfjro@users.sourceforge.net
Subject: [PATCH 0/2] aufs: headers (Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt)
Date: Tue,  3 Jan 2012 14:21:20 +0900
Message-ID: <1325568082-25540-1-git-send-email-sfjro@users.sourceforge.net>
References: <Pine.BSM.4.64L.1201021735430.29291@herc.mirbsd.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail03-md.ns.itscom.net ([175.177.155.113]:50965 "EHLO
	mail03-md.ns.itscom.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750743Ab2ACFVZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Jan 2012 00:21:25 -0500
Received: from scan06-mds.s.noc.itscom.net (scan06-md.ns.itscom.net [175.177.155.101])
	by mail03-md-outgoing.ns.itscom.net (Postfix) with ESMTP id CBEE2FF047E
	for <linux-m68k@vger.kernel.org>; Tue,  3 Jan 2012 14:21:22 +0900 (JST)
In-Reply-To: <Pine.BSM.4.64L.1201021735430.29291@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: tg@mirbsd.de
Cc: aufs-users@lists.sourceforge.net, debian-kernel@lists.debian.org, linux-m68k@vger.kernel.org

From: J. R. Okajima <hooanon05@yahoo.co.jp>

Thorsten Glaser:
> Please send patches that _should_ apply against what=E2=80=99s in Debian.
> I don=E2=80=99t have time to play the merge game at the moment.

Which version of debian?
As you might know, the aufs module in the debian stable squeeze is out
of my control.
Anyway, this patch series is against the aufs2.2-35 branch in
aufs2-standalone.git.


J. R. Okajima (2):
  aufs: headers 1/2, bugfix, where the pr_fmt macro definition
  aufs: headers 2/2, simply refined

 fs/aufs/Makefile          |    4 ++--
 fs/aufs/branch.c          |    1 -
 fs/aufs/branch.h          |    2 --
 fs/aufs/cpup.c            |    2 --
 fs/aufs/cpup.h            |    4 ----
 fs/aufs/dbgaufs.h         |    3 ---
 fs/aufs/dcsub.h           |    1 -
 fs/aufs/debug.c           |    1 -
 fs/aufs/debug.h           |    8 --------
 fs/aufs/dentry.h          |    1 -
 fs/aufs/dir.c             |    1 -
 fs/aufs/dir.h             |    1 -
 fs/aufs/dynop.h           |    4 ----
 fs/aufs/export.c          |    1 -
 fs/aufs/f_op.c            |    2 --
 fs/aufs/f_op_sp.c         |    1 -
 fs/aufs/file.c            |    3 ---
 fs/aufs/file.h            |    1 -
 fs/aufs/finfo.c           |    1 -
 fs/aufs/fstype.h          |    1 -
 fs/aufs/hfsplus.c         |    1 -
 fs/aufs/i_op.c            |    2 --
 fs/aufs/inode.h           |    2 --
 fs/aufs/ioctl.c           |    1 -
 fs/aufs/opts.c            |    2 --
 fs/aufs/opts.h            |    3 ---
 fs/aufs/rdu.c             |    2 --
 fs/aufs/rwsem.h           |    1 -
 fs/aufs/sbinfo.c          |    1 -
 fs/aufs/spl.h             |    4 ----
 fs/aufs/super.c           |    3 +--
 fs/aufs/super.h           |    1 -
 fs/aufs/sysaufs.c         |    2 --
 fs/aufs/sysaufs.h         |    2 --
 fs/aufs/sysfs.c           |    3 ---
 fs/aufs/sysrq.c           |    3 ---
 fs/aufs/vdir.c            |    1 -
 fs/aufs/vfsub.c           |    2 --
 fs/aufs/whout.c           |    1 -
 fs/aufs/whout.h           |    1 -
 fs/aufs/wkq.h             |    4 ----
 fs/aufs/xino.c            |    2 --
 include/linux/aufs_type.h |   20 ++++++++++++++------
 43 files changed, 17 insertions(+), 90 deletions(-)

-- 
1.7.2.5
