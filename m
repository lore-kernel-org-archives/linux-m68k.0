From: <gerg@snapgear.com>
Subject: [PATCH v3 0/6] m68knommu: merge and clean up of arch/m68k/lib files
Date: Thu, 21 Apr 2011 10:24:45 +1000
Message-ID: <1303345491-27888-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:58607 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752687Ab1DUAZU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 20:25:20 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The following set of patches is version 3 of clean ups and merges of
individual files in the arch/m68k/lib directory. The only change over
version 3 is that the processor list that supports the more complex
instructions includes the __mcpu32__ type.

I have build and run tested on ARAnyM/Atari and ColdFire (non-mmu)
targets.
