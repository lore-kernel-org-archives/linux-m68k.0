From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v7] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Fri, 23 Aug 2019 06:59:25 -0600
Message-ID: <875526ec-e514-362a-8730-6424bd10b517@kernel.dk>
References: <20190823104911.6840-1-max@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823104911.6840-1-max@enpas.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Max Staudt <max@enpas.org>, b.zolnierkie@samsung.com
Cc: linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

On 8/23/19 4:49 AM, Max Staudt wrote:
> Up until now, the pata_buddha driver would only check for cards on
> initcall time. Now, the kernel will call its probe function as soon
> as a compatible card is detected.

Applied for 5.4, thanks everyone.

-- 
Jens Axboe
