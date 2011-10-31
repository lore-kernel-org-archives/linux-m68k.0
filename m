From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 23/36] m68k: ColdFire V4e MMU paginit init code and miss
 handler
Date: Mon, 31 Oct 2011 14:46:41 +1000
Message-ID: <4EAE2831.1090006@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com> <1319527168-11166-24-git-send-email-gerg@snapgear.com> <alpine.LNX.2.00.1110310144070.2638@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:41193 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751454Ab1JaEsN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Oct 2011 00:48:13 -0400
In-Reply-To: <alpine.LNX.2.00.1110310144070.2638@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Finn,

On 31/10/11 01:56, Finn Thain wrote:
>
> On Tue, 25 Oct 2011, gerg@snapgear.com wrote:
>
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> The quite different ColdFire V4e MMU requires its own dedicated pageing
>
> s/pageing/paging/

Thanks. Fixed this and the wirh/with one too.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
