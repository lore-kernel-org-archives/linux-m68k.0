From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH for 2.6.28 stable] m68knommu: fix m68knommu defconfig
 can't build
Date: Mon, 12 Jan 2009 23:06:59 +1000
Message-ID: <496B4073.4040108@snapgear.com>
References: <20081230193943.1281.KOSAKI.MOTOHIRO@jp.fujitsu.com> <48E9AE16.2000002@snapgear.com> <20090112104447.GG28564@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090112104447.GG28564@linux-sh.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Mundt <lethal@linux-sh.org>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>

Paul Mundt wrote:
> On Mon, Oct 06, 2008 at 04:20:06PM +1000, Greg Ungerer wrote:
>> Hi Kosako,
>>
>> KOSAKI Motohiro wrote:
>>> I guess nobody don't test m68knommu at all last three month.
>>> Do we still need to maintain this architecture?
>> Yes, we do.
>>
> Any effort to get m68knommu folded in to m68k proper? This might help

Some :-)
The header merge is the first step.


> with some of your bitrot issues.. And likely less work to do in
> supporting those m68knommu parts that ship with MMUs ;-)
> 
> m68knommu is the only one of the mmu/nommu variants left that ships in
> its own architecture directory rather than being folded in to its parent.
> It would be good to get rid of it one of these days.

Yep. I think we will likely make some progress on this over
the next few months...



-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear, a McAfee Company                  PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
