From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new email
 address
Date: Mon, 04 Jan 2010 04:49:13 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001040444110.8966@zirkon.biophys.uni-duesseldorf.de>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org

Hi Geert,

> Cfr. commit 2f82af08fcc7dc01a7e98a49a5995a77e32a2925 ("Nicolas Pitre has a new
> email address")

Thanks - I've started a fresh attempt to get the Atari kernel built and tested 
but I only get 'double bus fault' from ARAnyM regardless of cross compiler used. 
No console output, seems to happen before console init. 

You still test kernels on ARAnyM, do you? What kernel version was the last Atari 
defconfig based on? 

Cheers,

	Michael
