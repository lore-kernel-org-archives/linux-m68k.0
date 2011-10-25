From: <gerg@snapgear.com>
Subject: [PATCH 00/36] m68k: ColdFire MMU support
Date: Tue, 25 Oct 2011 17:18:52 +1000
Message-ID: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25161 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754342Ab1JYHTu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:19:50 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi All,

The following patch set adds support for running the V4e ColdFire cores
with their MMU enabled. This is very much a request for comments. I expect
a lot more cleanup is required here. But this is a start.

This patch set is based on 3.1 with all the recent patches I have sent here
applied first. It is available as a git tree for easier testing, just pull
this tree, with the cfmmu branch:

  git@github.com:gregungerer/m68knommu.git cfmmu

Some of the code in this set is taken from Freescales 2.6.25 kernel support
of MMU ColdFire.

I have pretty much ignored FPU support in this code. I would like to handle
it later in a follow up patch set. But it does mean some ugly ifdefery in a
couple of files. I expect a couple of the patches in here can be dropped
once Geert has merged his IRQ changes.

Currently shared libraries are not working, only statically compiled apps.
For reference I am using a gcc-4.5.1 based toolchain.

Specifically I am testing this on a ColdFire 5475 (on a FireBee board).
I have test compiled and run this patch set on ARAnyM as well, I didn't have
any problems there. Also test compiled and run on MMU-less ColdFire.

Regards
Greg
