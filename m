From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 03/10] net: ax88796: Do not free IRQ in ax_remove()
 (already freed in ax_close()).
Date: Tue, 17 Apr 2018 12:15:00 +0300
Message-ID: <9a3b70fd-f781-4f6a-2f34-61f86ef2c4bc@cogentembedded.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523916285-6057-4-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523916285-6057-4-git-send-email-schmitzmic@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>, netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hello!

On 4/17/2018 1:04 AM, Michael Schmitz wrote:

> From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> 
> This complements the fix in 82533ad9a1c that removed the free_irq

    You also need to specify the commit's summary line enclosed in ("").

> call in the error path of probe, to also not call free_irq when
> remove is called to revert the effects of probe.
> 
> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
[...]

MBR, Sergei
