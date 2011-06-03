From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Support for MMU-less Atari ST
Date: Fri, 3 Jun 2011 17:04:03 +1000
Message-ID: <4DE88763.4030705@snapgear.com>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:22168 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752619Ab1FCHEs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Jun 2011 03:04:48 -0400
In-Reply-To: <20110602192553.GA2071@matze-K8NF4G-SATA2>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Cc: linux-m68k@vger.kernel.org

Hi Matthias,

On 03/06/11 05:25, Matthias Reis wrote:
> since the m68k and the m68knommu trees have now been merged, I wonder if it is possible to run linux on mmu-less 68000 machines like the (original) Atari ST. I think the first thing to do would be to modify arch/m68k/kernel/head.S in order to handle non-mmu CPUs. I would be happy to do some work on this but the problem is that I'm not very familiar with the kernel so far. It would be nice if someone could tell me which things need to be done to run linux on a mmu-less Atari ST. I'm not expecting detailed step-by-step instructions, but rather some hints where the MMU- or 68020-dependent stuff in the Atari drivers lies.

Although m68k and m68knommu now all live in one arch directory a lot
of the pieces are not really integrated yet. We are working towards
that now.

I haven't looked in arch/m68k/kernel/head.S yet, but if that can
be made to work without enabling the MMU then that seems like a
reasonable start. Currently the non-mmu based targets do not use
that (there is a couple of different head.S files for various
targets/cpus under arch/m68k/platfom/, search for files with "head"
in the name). Ultimately it would be nice to clean all those up.

Above that you may well hit problems trying to get timers and
interrupts working, might not be too hard to sort that out.
Basic device drivers might be ok. Lets see how far you can get :-)

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
