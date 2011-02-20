From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: merge of m68knommu and m68k arch branches?
Date: Mon, 21 Feb 2011 09:53:42 +1000
Message-ID: <4D61A986.3060308@snapgear.com>
References: <4D5DB83D.80205@snapgear.com>	<AANLkTin0X-ST=rZqwfCA0i5VGCh5ygYXyZFdndiDgR_2@mail.gmail.com>	<AANLkTim=kQOMyKqOEkw5iQjpGhDf0YGMe1ZTnJZkKfr7@mail.gmail.com>	<4D5EEEBB.7050708@snapgear.com>
	<AANLkTimmfUJASL47Cs80FJ2mkx3PPvAX57x43nF09tns@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <AANLkTimmfUJASL47Cs80FJ2mkx3PPvAX57x43nF09tns@mail.gmail.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gregungerer@westnet.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, Steven King <sfking00@yahoo.com>
List-Id: linux-m68k@vger.kernel.org


Hi Geert,

On 19/02/11 18:39, Geert Uytterhoeven wrote:
> On Fri, Feb 18, 2011 at 23:12, Greg Ungerer<gerg@snapgear.com>  wrote:
>> On 19/02/11 01:24, Geert Uytterhoeven wrote:
>>> On Fri, Feb 18, 2011 at 12:27, Geert Uytterhoeven<geert@linux-m68k.org>
>>>   wrote:
>>>>
>>>> On Fri, Feb 18, 2011 at 01:07, Greg Ungerer<gerg@snapgear.com>    wrote:
>>>>>
>>>>> I would like to put up for discussion a merge of the m68knommu and
>>>>> m68k arch branches.
>>>>>
>>>>> Attached is a script and patch that does a kind of brute force
>>>>> simplistic merge of the directories and files. (Thanks to Stephen King
>>>>> <sfking@fdwdc.com>    for the initial version of this script, and to
>>>>> Sam Ravnborg for the m68k includes merge script this was based on).
>>>>> Nothing outside of the arch/m68k and arch/m68knommu directories is
>>>>> touched, and in the end there is no more arch/m68knommu. To apply you
>>>>> simply run the script from the top of a current kernel git tree (I used
>>>>> 2.6.38-rc5 for testing) and then apply the patch.
>>>>
>>>> Building...
>>>
>>> Builds fine (all test configs), runs on ARAnyM.
>>>
>>> Let's go ahead?
>>
>> What sort of timing do you think makes sense?
>> Is for 2.6.39 too soon?
>
> Personally, I don't mind. 2.6.39 is OK for me. I guess the safest way
> is to let Linus
> execute the script? Before or after the merge window?

Well I was going to construct the merge as a single git commit
(which is equivalent to running this script and applying the patch).
Linus would then just pull this.

The best timing for me is near the end of the merge window.
That way we can both get in any other changes first.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
