From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: make headers_install broken for ARCH=m68k in 2.6.29-rc7.
Date: Thu, 19 Mar 2009 09:53:43 +1000
Message-ID: <49C18987.5000009__40245.9758254283$1237420525$gmane$org@snapgear.com>
References: <200903120437.03837.rob@landley.net> <200903172304.00157.rob@landley.net> <49C087F3.3080507@snapgear.com> <200903181312.02047.rob@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <200903181312.02047.rob@landley.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-next@vger.kernel.org, linux-m68k@lists.linux-m68k.org

Hi Rob,

Rob Landley wrote:
> On Wednesday 18 March 2009 00:34:43 Greg Ungerer wrote:
>> Hi Rob,
>>
>> Rob Landley wrote:
>>> On Monday 16 March 2009 18:10:45 Greg Ungerer wrote:
>>>>>>    git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
>>>>>> fix-includes
> ...
>>> What _should_ I have done?
>> The git clone you have done will just get the master branch,
>> and put it in a directory named fix-includes.
>>
>> Which is ok, but you still won't have the "fix-includes" branch.
>> Do this after the clone:
>>
>>    git pull
>> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
>> fix-includes
> 
> Ah, that did something interesting...  And the resulting headers built in 
> uClibc.  (Works for me!)
> 
> confirmed-uClibc-builds-with-it-by: Rob Landley <rob@landley.net>

Thats great, thanks.
I'll push to Linus then.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear, a McAfee Company                  PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
