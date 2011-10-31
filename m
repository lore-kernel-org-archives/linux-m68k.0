From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 16/36] m68k: set ColdFire MMU page size
Date: Mon, 31 Oct 2011 14:41:59 +1000
Message-ID: <4EAE2717.6070507@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>	<1319527168-11166-17-git-send-email-gerg@snapgear.com> <CAMuHMdUksKmucNHEVSXR+RdGoA-wzGHgo49NYDdJd=gdiKC76w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:10325 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751941Ab1JaEnz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Oct 2011 00:43:55 -0400
In-Reply-To: <CAMuHMdUksKmucNHEVSXR+RdGoA-wzGHgo49NYDdJd=gdiKC76w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 30/10/11 23:29, Geert Uytterhoeven wrote:
> On Tue, Oct 25, 2011 at 09:19,<gerg@snapgear.com>  wrote:
>> We use the ColdFire V4e MMU page size of 8kb. Define PAGE_SHIFT
>> appropriately.
>
> 8kb = 0.9765625 KiB ;-)

Indeed :-)
Fixed up. And all the other little spelling mistakes and typos :-)

Thanks
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
