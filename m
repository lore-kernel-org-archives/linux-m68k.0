From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v5] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 12 Aug 2019 18:51:03 +0200
Message-ID: <30f4ef58-a2a7-d469-0828-d878c51c4da4@enpas.org>
References: <20190812164830.16244-1-max@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812164830.16244-1-max@enpas.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: b.zolnierkie@samsung.com, axboe@kernel.dk
Cc: linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

On 08/12/2019 06:48 PM, Max Staudt wrote:
> +/*
> + * We cannot have a modalias for X-Surf boards, as it competes with the
> + * zorro8390 network driver. As a stopgap measure until we have proper
> + * MFC support for this board, we manually attach to it late after Zorro
> + * has enumerated its boards.
> + */

I spotted a typo here, s/MFC/MFD/


Max
