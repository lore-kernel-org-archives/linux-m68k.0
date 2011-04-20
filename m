From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH v2 0/6] m68knommu: merge and clean up of arch/m68k/lib
 files
Date: Wed, 20 Apr 2011 16:04:05 +1000
Message-ID: <4DAE7755.6000408@snapgear.com>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com> <1303278880-16153-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:24938 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752651Ab1DTGFT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 02:05:19 -0400
In-Reply-To: <1303278880-16153-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

On 20/04/11 15:54, gerg@snapgear.com wrote:
> I have build and run tested on ARAnyM/Atari and ColdFire (non-mmu)
> targets.

Sorry, top of that message got lost somewhere, should be:


The following set of patches is version 2 of clean ups and merges of
individual files in the arch/m68k/lib directory. It is mostly the same
as the first version, but drops the removal of string.c, and does a
simple cleanup of checksum.c.

I have build and run tested on ARAnyM/Atari and ColdFire (non-mmu)
targets.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
