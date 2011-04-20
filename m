From: <gerg@snapgear.com>
Subject: [PATCH v2 0/6] m68knommu: merge and clean up of arch/m68k/lib files
Date: Wed, 20 Apr 2011 15:54:33 +1000
Message-ID: <1303278880-16153-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:44775 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751626Ab1DTF4u (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 01:56:50 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The following set of patches is version 2 of clean ups and merges of
individual files in the arch/m68k/lib directory. It is mostly the same
as the first version, but drops the removal of string.c, and does a
simple cleanup of checksum.c.

I have build and run tested on ARAnyM/Atari and ColdFire (non-mmu)
targets.
