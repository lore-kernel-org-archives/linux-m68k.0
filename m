From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68knommu: fix FEC platform device registration when
 driver is modular
Date: Mon, 11 Jan 2016 22:29:36 +1000
Message-ID: <5693A030.4090402@uclinux.org>
References: <1452475316-20008-1-git-send-email-gerg@uclinux.org>
 <CAMuHMdXarYfyvy3AHW+=Bmx2NQZigB+a8hjE5J8ikr_R+f8OGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:28740
	"EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758081AbcAKM3l (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 11 Jan 2016 07:29:41 -0500
In-Reply-To: <CAMuHMdXarYfyvy3AHW+=Bmx2NQZigB+a8hjE5J8ikr_R+f8OGQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


On 11/01/16 17:50, Geert Uytterhoeven wrote:
> On Mon, Jan 11, 2016 at 2:21 AM, Greg Ungerer <gerg@uclinux.org> wrote:
>> The FEC (Fast Ethernet Crontroller) module on many ColdFire parts can
>> be compiled into the kernel, or as a module. Therefore the platform device
>> support for it is required whenever the driver is enabled - not just when
>> built into the kernel. Use IS_ENABLED(CONFIG_FEC) instead of a conditional
>> check on only the driver being built into the kernel.
>>
>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks Geert!

Regards
Greg
