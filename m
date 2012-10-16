From: "Stany MARCEL" <smarcel@pactenovation.fr>
Subject: =?iso-8859-1?Q?RE=A0=3A_=5BPATCH_3/4_V2=5D_Add_for_MCF54xx_a_virtual_non_?=
	=?iso-8859-1?Q?cached_zone_usable_for_data_exchange_with_DMA?=
Date: Tue, 16 Oct 2012 15:57:21 +0200
Message-ID: <1512C13C0C5EA947AE50B9B9AC314F4701B00E1F@ATLAS.pactenovation.fr>
References: <1350305680-5441-3-git-send-email-stany.marcel@novasys-ingenierie.com> <1350307324-7396-1-git-send-email-stany.marcel@novasys-ingenierie.com> <507CED8E.1000004@snapgear.com> <1512C13C0C5EA947AE50B9B9AC314F4701B00E1D@ATLAS.pactenovation.fr> <507D5312.4000704@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gpn92sys-242-163.cnt.nerim.net ([195.5.242.163]:13277 "EHLO
	ATLAS.pactenovation.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753267Ab2JPNw6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 16 Oct 2012 09:52:58 -0400
Content-class: urn:content-classes:message
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

Hi Greg,

For Informations, here are some measurements I can remember of
different solutions I have tested, measurements where done with iperf
in TCP and UDP :

 - Copyback cache without flush: ~40Mbits/sec in TCP but UDP tests
   shows a lot of lost frames.  

 - Copyback cache with full data flush : ~9Mbits/sec in TCP, don't
  remember in UDP.

 - DMA_ZONE : ~32Mbits/sec, UDP ok.

These results are very approximative, if I can I'll try to give you
more precise tests results.

For the partitioning and used TLB entries, with default settings I map
8MiB with 8TLB entry (on 32).

I choose this path as it is recommended by the documentation and I
also saw that it was the solution used by Freescale, on their old
Linux patch.

I agree that cache managing functions should also be improved. But
with available cache management possibility on mcf54xx mcu, I don't
see how to perform effectively the operations needed to exchange data
with built-in DMA.

So for my project I will live with this solution for the moment.

Regards,

-- 
Stany
