From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v7] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Fri, 23 Aug 2019 15:03:35 +0200
Message-ID: <9e20397a-debb-c8d0-ef0a-cf576aae0ad0@enpas.org>
References: <20190823104911.6840-1-max@enpas.org>
 <875526ec-e514-362a-8730-6424bd10b517@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <875526ec-e514-362a-8730-6424bd10b517@kernel.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, b.zolnierkie@samsung.com, geert@linux-m68k.org
Cc: linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com
List-Id: linux-m68k@vger.kernel.org

On 08/23/2019 02:59 PM, Jens Axboe wrote:
> On 8/23/19 4:49 AM, Max Staudt wrote:
>> Up until now, the pata_buddha driver would only check for cards on
>> initcall time. Now, the kernel will call its probe function as soon
>> as a compatible card is detected.
> 
> Applied for 5.4, thanks everyone.

Thanks Jens and Bartlomiej, and if I may: Thanks Geert for reviewing almost every single one of my m68k patches. This is a warm welcome to a new field.


Max
