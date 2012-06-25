From: Andreas Schwab <schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] mod/file2alias: make modalias generation safe for cross compiling
Date: Mon, 25 Jun 2012 23:43:15 +0200
Message-ID: <m28vfb130s.fsf@igel.home>
References: <CAMuHMdXk6pByz14JcDgY+UE6QM0sHD8cbXye9CgOVSRRtr7J+Q@mail.gmail.com>
	<20120615201021.GB14544@kroah.com>
	<CAMuHMdUj6tAcWhkSkV43Kw3-2-3+JzgP6W=2w3fjL2KBfRh9ZQ@mail.gmail.com>
	<20120615231220.GC8205@kroah.com> <87lijns84s.fsf@nemi.mork.no>
	<m2bokjb6tv.fsf@igel.home> <87fw9urqau.fsf@nemi.mork.no>
	<m2d34n1sz9.fsf_-_@igel.home>
	<alpine.DEB.2.00.1206252217580.21346@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.00.1206252217580.21346-97SZ98TBZzA1xEWliksxXw@public.gmane.org> (Geert
	Uytterhoeven's message of "Mon, 25 Jun 2012 22:32:53 +0200 (CEST)")
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: =?utf-8?Q?Bj=C3=B8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kbuild <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux/m68k <linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> writes:

> 	Hi Andreas,
>
> On Mon, 25 Jun 2012, Andreas Schwab wrote:
>> --- /dev/null
>> +++ b/scripts/mod/devicetable-offsets.c
>> @@ -0,0 +1,171 @@
>> +#include <linux/kbuild.h>
>> +#include <linux/mod_devicetable.h>
>> +
>> +#define DEVID(devid) DEFINE(SIZE_##devid, sizeof(struct devid))
>> +#define DEVID_FIELD(devid, field) \
>> +	DEFINE(OFF_##devid##_##field, offsetof(struct devid, field))
>> +
>> +int main(void)
>> +{
>> +	DEVID(usb_device_id);
>> +	DEVID_FIELD(usb_device_id, match_flags);
>> +	DEVID_FIELD(usb_device_id, idVendor);
>> +	DEVID_FIELD(usb_device_id, idProduct);
>> +	DEVID_FIELD(usb_device_id, bcdDevice_lo);
>> +	DEVID_FIELD(usb_device_id, bcdDevice_hi);
>> +	DEVID_FIELD(usb_device_id, bDeviceClass);
>> +	DEVID_FIELD(usb_device_id, bDeviceSubClass);
>> +	DEVID_FIELD(usb_device_id, bDeviceProtocol);
>> +	DEVID_FIELD(usb_device_id, bInterfaceClass);
>> +	DEVID_FIELD(usb_device_id, bInterfaceSubClass);
>> +	DEVID_FIELD(usb_device_id, bInterfaceProtocol);
>
> These are all duplicates of the structures in <linux/mod_devicetable.h>.
> Can't you get rid of the duplication by putting e.g. the following
> in <linux/mod_devicetable.h>:
>
>     DEVID_START(usb_device_id);
>     DEVID_FIELD(usb_device_id, __u16, match_flags);
>     DEVID_FIELD(usb_device_id, __u16, idVendor);
>     DEVID_FIELD(usb_device_id, __u16, idProduct);
>     DEVID_FIELD(usb_device_id, __u16, bcdDevice_lo);
>     DEVID_FIELD(usb_device_id, __u16, bcdDevice_hi);
>     DEVID_FIELD(usb_device_id, __u8, bDeviceClass);
>     DEVID_FIELD(usb_device_id, __u8, bDeviceSubClass);
>     DEVID_FIELD(usb_device_id, __u8, bDeviceProtocol);
>     DEVID_FIELD(usb_device_id, __u8, bInterfaceClass);
>     DEVID_FIELD(usb_device_id, __u8, bInterfaceSubClass);
>     DEVID_FIELD(usb_device_id, __u8, bInterfaceProtocol);
>     DEVID_END();
>
> and redefining the DEVID_*() macros depending on
>   1. __KERNEL__, to generate the C struct definitions for kernel builds,
>   2. first inclusion by devicetable-offsets.c, also to generate C struct
>      definitions,
>   3. second inclusion by devicetable-offsets.c, to generate the sizes and
>      offset definitions for modalias?

That requires some reorganisation of the struct pnp_card_device_id which
has a somewhat complicated structure (which also accounts for the
ugliest part of the patch).

Andreas.

-- 
Andreas Schwab, schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
