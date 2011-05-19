From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH] m68k: merge mmu and non-mmu bitops.h
Date: Thu, 19 May 2011 22:05:48 +1000
Message-ID: <4DD5079C.1060103@snapgear.com>
References: <1305696747-29641-1-git-send-email-gerg@snapgear.com> <20110519085232.GA27058@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outbound-mail03.westnet.com.au ([203.10.1.244]:36475 "EHLO
	outbound-mail03.westnet.com.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752739Ab1ESMFx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 19 May 2011 08:05:53 -0400
In-Reply-To: <20110519085232.GA27058@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On 19/05/11 18:52, Philippe De Muyter wrote:
> On Wed, May 18, 2011 at 03:32:27PM +1000, gerg@snapgear.com wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> The following patch merges the mmu and non-mmu versions of the m68k
>> bitops.h files. Now there is a good deal of difference between the two
>> files, but none of it is actually an mmu specific difference. It is
>> all about the specific m68k/coldfire varient we are targeting. So it
>> makes an awful lot of sense to merge these into a single bitops.h.
>
> Thanks for taking care of that.  Fork was easy (but ugly), but merge
> is a tedious job.

Sure is :-)


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
