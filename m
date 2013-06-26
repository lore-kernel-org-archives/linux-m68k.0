From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: iop_msg_pool
Date: Wed, 26 Jun 2013 22:14:51 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1306262153080.20472@nippy.intranet>
References: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com> <alpine.LNX.2.00.1306262026380.19790@nippy.intranet> <CAMuHMdXzh-3f2hRtUDxd3M+Gu9s1uLt-sPiERYDkXNuKkuUBig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:58713 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752018Ab3FZMPI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Jun 2013 08:15:08 -0400
In-Reply-To: <CAMuHMdXzh-3f2hRtUDxd3M+Gu9s1uLt-sPiERYDkXNuKkuUBig@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


On Wed, 26 Jun 2013, Geert Uytterhoeven wrote:

> Are iop_scc_present and iop_ism_present mutually exclusive?

Both are true or both are false, assuming the existing values in 
mac_data_table[]. But looking at iop_preinit(), I'd guess that the idea 
was to have the ability to disable either the SCC or the ADB channel for a 
particular model for development purposes. So I'd treat them as 
independent.

Finn
