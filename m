From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH 4/9] m68k: allow NULL clock for clk_get_rate
Date: Wed, 19 Jul 2017 22:21:22 +1000
Message-ID: <d5b71b9d-acd3-a938-5460-471e76badad3__41913.7241472074$1500466904$gmane$org@linux-m68k.org>
References: <20170718101730.2541-1-jonas.gorski@gmail.com>
 <20170718101730.2541-5-jonas.gorski@gmail.com>
 <d9bde8fc-acd0-5b27-1c55-53c65a88ee06@linux-m68k.org>
 <CAOiHx==j=HhkWTthkHqDNpUMLEC0Y3MAkJY3ecR1H=hD-BLF6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAOiHx==j=HhkWTthkHqDNpUMLEC0Y3MAkJY3ecR1H=hD-BLF6Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Jonas,

On 19/07/17 19:06, Jonas Gorski wrote:
> Hi Greg,
> 
> On 18 July 2017 at 14:03, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> Hi Jonas,
>>
>> On 18/07/17 20:17, Jonas Gorski wrote:
>>>
>>> Make the behaviour of clk_get_rate consistent with common clk's
>>> clk_get_rate by accepting NULL clocks as parameter. Some device
>>> drivers rely on this, and will cause an OOPS otherwise.
>>>
>>> Fixes: facdf0ed4f59 ("m68knommu: introduce basic clk infrastructure")
>>> Cc: Greg Ungerer <gerg@linux-m68k.org>
>>
>>
>> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>>
>> Do you want me to push this via the m68knommu git tree?
>> Or are you (or someone) taking the series as a whole?
> 
> Please take it through your tree. I totally forgot mentioning in the
> cover letter that I'm just a simple patch submitter and don't have my
> own tree. Too long ago that I sent a multi-tree patch series last time

No problem. Added to the m68knommu git tree, for-next branch.

Thanks
Greg
