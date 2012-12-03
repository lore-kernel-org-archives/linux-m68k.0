From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: merge arch free memory functions into a single
 function
Date: Mon, 3 Dec 2012 16:29:33 +1000
Message-ID: <50BC46CD.3050507@snapgear.com>
References: <1354249670-4376-1-git-send-email-gerg@snapgear.com> <alpine.LNX.2.00.1212011441010.9740@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:17154 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750906Ab2LCGZm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 3 Dec 2012 01:25:42 -0500
In-Reply-To: <alpine.LNX.2.00.1212011441010.9740@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Finn,

On 01/12/12 13:49, Finn Thain wrote:
> On Fri, 30 Nov 2012, gerg@snapgear.com wrote:
>
>> -	pr_notice("Freeing unused kernel memory: %luk freed (0x%x - 0x%x)\n",
>> -		(addr - (unsigned long) __init_begin) >> 10,
>> -		(unsigned int) __init_begin, (unsigned int) __init_end);
>> +	pr_notice("Freeing %s memory: %dk freed (0x%lx-0x%lx)\n", name,
>> +		pages << (PAGE_SHIFT - 10), start, end);
>
> Perhaps "Freed %d KiB %s memory: 0x%lx - 0x%lx\n" is better (a tad shorter
> and has the correct unit).

Sure. New patch coming up.

Thanks
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
