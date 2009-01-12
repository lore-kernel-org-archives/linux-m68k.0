From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH for 2.6.28 stable] m68knommu: fix m68knommu defconfig can't build
Date: Mon, 12 Jan 2009 19:44:47 +0900
Message-ID: <20090112104447.GG28564@linux-sh.org>
References: <20081230193943.1281.KOSAKI.MOTOHIRO@jp.fujitsu.com> <48E9AE16.2000002@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48E9AE16.2000002@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, stable@kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Oct 06, 2008 at 04:20:06PM +1000, Greg Ungerer wrote:
> Hi Kosako,
> 
> KOSAKI Motohiro wrote:
> >I guess nobody don't test m68knommu at all last three month.
> >Do we still need to maintain this architecture?
> 
> Yes, we do.
> 
Any effort to get m68knommu folded in to m68k proper? This might help
with some of your bitrot issues.. And likely less work to do in
supporting those m68knommu parts that ship with MMUs ;-)

m68knommu is the only one of the mmu/nommu variants left that ships in
its own architecture directory rather than being folded in to its parent.
It would be good to get rid of it one of these days.
