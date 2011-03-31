From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 0/5] m68k: merge and clean up files in m68k/mm
Date: Thu, 31 Mar 2011 14:19:26 +1000
Message-ID: <1301545171-19204-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:31821 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751067Ab1CaEVc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 31 Mar 2011 00:21:32 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


The following set of patches cleans up and merges individual files in
the arch/m68k/mm directory. Mostly strait forward stuff, and mostly
it changes the m68knommu parts.

I have build and run tested on ARAnyM/Atari and ColdFire (non-mmu)
targets.
