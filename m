From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 0/6] m68k: merge and clean up files in m68k/lib
Date: Wed, 30 Mar 2011 17:58:21 +1000
Message-ID: <1301471907-10204-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17231 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754175Ab1C3H72 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 03:59:28 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


The following set of patches cleans up and merges individual files in
the arch/m68k/lib directory. Mostly strait forward stuff,

I have build and run tested on ARAnyM/Atari and ColdFire (non-mmu)
targets.

Not sure why git/diff mangled some of these a little. The changes to
patche 5, string.h, are simpler than it looks... These where generated
with "git format-patch -M -B" to make it easier to review the file
movements.
