From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH v2 01/22] m68knommu: introduce macros to
 simplify ColdFire GPIO table initialization
Date: Thu, 26 Apr 2012 23:48:52 +1000
Message-ID: <4F995244.5040204@snapgear.com>
References: <1335446091-11177-1-git-send-email-gerg@snapgear.com>
 <CALF0-+V5u6EGo8FH9i18jFn1-vmv863+cTdb5aQ8V2ZCdNYchQ@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <CALF0-+V5u6EGo8FH9i18jFn1-vmv863+cTdb5aQ8V2ZCdNYchQ@mail.gmail.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <elezegarcia@gmail.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

Hi Ezequiel,

On 04/26/2012 11:29 PM, Ezequiel Garc=EDa wrote:
> Hi Greg,
>
> Just some very minor typos....
>
> On Thu, Apr 26, 2012 at 10:14 AM,<gerg@snapgear.com>  wrote:
>>
>> +/*
>> + * =C3=A1 =C3=A1 Define macros to ease the pain of setting up the GPIO =
tables. There
>> + * =C3=A1 =C3=A1 is two cases we need to deal with here, they cover all=
 currently
>
> There *are* two cases?
>
>> + * =C3=A1 =C3=A1 available ColdFire GPIO hardware. There is of course m=
inor differences
>
> There *are* of course minor differences?

Thanks, I'll fix those.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
