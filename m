From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH v2] m68k: fix ColdFire clear cache operation
Date: Thu, 12 Jul 2012 11:50:51 +1000
Message-ID: <4FFE2D7B.8090405@snapgear.com>
References: <1341967036-14645-1-git-send-email-gerg@snapgear.com> <20120711155148.GA26577@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:57823 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756467Ab2GLBtf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 11 Jul 2012 21:49:35 -0400
In-Reply-To: <20120711155148.GA26577@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Hi Philippe,

On 12/07/12 01:51, Philippe De Muyter wrote:
> On Wed, Jul 11, 2012 at 10:37:16AM +1000, gerg@snapgear.com wrote:
>
>> +	__asm__ __volatile__ (
>> +		"movec	%0,%%cacr\n\t"
>> +		"nop\n\t"
>
> This could be written as
>
> 		"movec %0,%%cacr; nop"

It could, but IMHO that is not as clear. One instruction per line
is easier to read.


> i.e. :
> 	final "\n\t" is useless

Yep, I will remove that.

Thanks
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
