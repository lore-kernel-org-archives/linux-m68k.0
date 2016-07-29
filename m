From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH 0/3] m68k: flat file load fix and cleanup
Date: Fri, 29 Jul 2016 14:39:20 +1000
Message-ID: <9cb6afd7-3052-8510-3a36-4bc085ae0d63@linux-m68k.org>
References: <1469148009-25426-1-git-send-email-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out3.external.iinet.net.au ([203.59.1.153]:37438
	"EHLO icp-osb-irony-out3.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750721AbcG2EiN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 29 Jul 2016 00:38:13 -0400
In-Reply-To: <1469148009-25426-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

On 22/07/16 10:40, Greg Ungerer wrote:
> The following 3 patches fix m68k loading of flat binaries on MMU-enabled
> systems, and then based on that we can cleanup and combine some common
> code.
> 
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> ---
>  b/arch/m68k/include/asm/flat.h      |    8 +++++++-
>  b/arch/m68k/include/asm/processor.h |   15 +--------------
>  2 files changed, 8 insertions(+), 15 deletions(-)

Do you have any objection to me pushing these via the m68knommu
tree to Linus later next week?

They should only effect non-MMU targets.

Regards
Greg
