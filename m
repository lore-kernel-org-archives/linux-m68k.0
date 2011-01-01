From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: [PATCH 03/15]drivers:staging:rtl8187se:r8180_hw.h Typo change
 diable to disable.
Date: Sat, 01 Jan 2011 06:53:34 -0800
Message-ID: <4D1F3FEE.7__44888.2512785078$1293893622$gmane$org@gmail.com>
References: <1293750484-1161-1-git-send-email-justinmattock@gmail.com> <1293750484-1161-2-git-send-email-justinmattock@gmail.com> <1293750484-1161-3-git-send-email-justinmattock@gmail.com> <alpine.LNX.2.00.1012311722580.24460@nippy.intranet> <4D1EDB22.2020308@gmail.com> <20110101090931.GH1886@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20110101090931.GH1886@bicker>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Dan Carpenter <error27@gmail.com>, Finn Thain <fthain@telegraphics.com.au>, devel@driverdev.osuosl.org, trivial@kernel.org, linux-scsi@vger.kernel.org, netdev@vger.kernel.orglinux-

On 01/01/2011 01:09 AM, Dan Carpenter wrote:
> On Fri, Dec 31, 2010 at 11:43:30PM -0800, Justin P. Mattock wrote:
>> On 12/31/2010 10:48 PM, Finn Thain wrote:
>>>> -/*  BIT[8-9] is for SW Antenna Diversity. Only the value EEPROM_SW_AD_ENABLE means enable, other values are diable.					*/
>>>> +/*  BIT[8-9] is for SW Antenna Diversity. Only the value EEPROM_SW_AD_ENABLE means enable, other values are disabled.					*/
>>>
>>> I think, "other values disable" was what you meant?
>>>
>>> Finn
>>>
>>>>   #define EEPROM_SW_AD_MASK			0x0300
>>>>   #define EEPROM_SW_AD_ENABLE			0x0100
>>>>
>>>>
>>>
>>
>> no! I changed it to disabled to make it proper..
>
> Finn is obviously right, but maybe a compromise would be:
>
> Only the value EEPROM_SW_AD_ENABLE means "enable", other values mean
> "disable".
>
> regards,
> dan carpenter
>

ahh.. I see what you your saying now.. alright let me send this out that 
way..

Justin P. Mattock
