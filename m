From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 00/36] m68k: ColdFire MMU support
Date: Mon, 31 Oct 2011 15:46:32 +1000
Message-ID: <4EAE3638.60604@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com> <CAMuHMdX_W5_nW=KYmT4UC-gd7d=J0=2_ZcyZVZkH7nnXgy-Kxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:20340 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752646Ab1JaFp7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Oct 2011 01:45:59 -0400
In-Reply-To: <CAMuHMdX_W5_nW=KYmT4UC-gd7d=J0=2_ZcyZVZkH7nnXgy-Kxg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi Geert,

On 30/10/11 23:47, Geert Uytterhoeven wrote:
> On Tue, Oct 25, 2011 at 09:18,<gerg@snapgear.com>  wrote:
>> The following patch set adds support for running the V4e ColdFire cores
>> with their MMU enabled. This is very much a request for comments. I expect
>> a lot more cleanup is required here. But this is a start.
>
> I replied a few comments to the individual patches, but in general it looks
> OK, so you can add my Acked-by.

Thats great, thanks, I really appreciate the review.

I will probably send a v2 after you have pushed the IRQ changes.
No doubt a couple of changes can be dropped from this patch set then.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
