Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C89117F4E0
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 May 2024 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717103805; cv=none; b=aCXLBb4rkhjtAN4MTij2eFbz8fdE4lVbfrWJE7C6RP17IzDzhzT2M9deoGGv48TKBiHMIq6a4FcB/CZ+uF/3nHtYs9XNlEWXgyVXiLJVmYdf/TMdKe8T+miOG9EznV3k5UytZC7/7rDdLEl/aeDsBv0Qu0VirNyMSLtP3gSRIjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717103805; c=relaxed/simple;
	bh=GAtMdiAA/xzgB7XU2VKynr9Vo8YhvN3z4mNUaF2SHY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Vkro+TPy/Pjev9YB0vijYY+vNpL4EM7CEFFi0kYkKwJms/mByI8/2Gbsv9rLKsOZm1kTz62wp7+gaxu4FexrcMwefMpfiC3t4huSwP3GE1YIkvNQI0CBtvhK0XuMwPq3BWo4BRsgBi4uUiVNREPO8Kx/IguRKbdR4VAFBGFKyzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PACWA9dw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PACWA9dw"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f6a045d476so1129079b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 May 2024 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717103803; x=1717708603; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kEtovHV6+VYiNF5dxp9/ZIi+Z8LgR1SL850vLfR3XmA=;
        b=PACWA9dwqkb5NjLjHPcK6N2YWPbWOJHKqsANto9OY1AGse4tjNm5LjxEPzGOc1joqA
         H4RhUTMAkFeDZH88ROqZ8XlbL5NQvks6uFORjvTqlrHBl9NRwIi42HspYUmARC87AAiz
         datp9wj1ijG/O6zjQiOIYqXDzMBygGsH/ZW0y0p8Mmfw1JsLcn+aHKXwtWpAjP0eS+Ja
         a8h8bQjT19RUC9a3BAjPTvOrUUwqYE2hwog45GhCXUiYgA2WG1eM496VksNSFnFybiIx
         /EMtgTmkQrfOtL+noS4faWZTIElcgP4qaC30d3wKG0/7zr8H8TxMm734Zt9lUiGe6w2v
         wJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717103803; x=1717708603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEtovHV6+VYiNF5dxp9/ZIi+Z8LgR1SL850vLfR3XmA=;
        b=gJtQq9YhGums/q0oG5Iz554HRLii/SNlLOWMIWMiTXVYF5TyG20Ohtp1CFS/RI2sxy
         /XOz6T+80m6sGxr1CXifB1rk05q9nH+9YSVBa/6UzDn0/+apGj1WweB3G4pMEiGNjOUr
         CePlowJqJZ2f6uve35cBg4OkYImZWmlWYk0fUHmIOlyDrt4ly/B995U9CwFyrWmONhTm
         A05kCw1yIfQTrZ6ET+Ft6y1U+Q3B5HF0z1GoPRlTqhJrr4n8M60tIzUmAb/KcMyK87Y0
         hywKI3HdDAThodfSg/1fg0RIgaDPKJnrFaI95kzHRy8EMpfo/Keak+Mnd3V09vI7c0jX
         v9MA==
X-Forwarded-Encrypted: i=1; AJvYcCUBeyT5reK2s4iYYXbWfUvvjly65FcZkQNbtPo6t0m1tj1Lg4uHD9f4mHD0Eal2CgUGp637WTvc5KMYPC1C4ti1mpKlx8PYDisUlud6mdBm
X-Gm-Message-State: AOJu0YzHpVOoJfOKmnCFBWx8zYFUXjxksMXLkIpJq9hxb+Ampgs6OgYV
	beBYLP244m/fHng/foqNZZxb1TgNHc26oinBtOsREIy4VagpqPSF
X-Google-Smtp-Source: AGHT+IHJqBXXuTDC5DRXHvaGfMTzKFjzqQE5qzK5jFrzmkxLyUHjJjCClEZ8uRZFfJMmg0T1bk+jpQ==
X-Received: by 2002:a05:6a20:2595:b0:1af:d4dd:65e5 with SMTP id adf61e73a8af0-1b26f146ba8mr218003637.21.1717103803458;
        Thu, 30 May 2024 14:16:43 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:38ee:ff33:e51f:95b2? ([2001:df0:0:200c:38ee:ff33:e51f:95b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242ae96acsm165072b3a.139.2024.05.30.14.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 14:16:42 -0700 (PDT)
Message-ID: <aea77fa1-9369-40f2-be17-d76c6da499a3@gmail.com>
Date: Fri, 31 May 2024 09:16:48 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k: amiga: config: upon boot, turn off all incoming
 interrupts from the Warp1260
To: Paolo Pisati <p.pisati@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20240530155719.680002-1-p.pisati@gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <20240530155719.680002-1-p.pisati@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Paolo,

thanks for addressing all review comments!

On 31/05/24 03:57, Paolo Pisati wrote:
> Amiga 1200 boot crashes in local_irq_enable() (or auto_irq_enable()) with an
> interrupt storm (the Warp1260 board interrupts appear to still be active at boot
> time): CS-Lab told me where to find the interrupt register (and its layout) so
> here's patch that turns off all incoming interrupts during
> config.c::amiga_parse_bootinfo().
>
> Changes since v1:
> -addressed all comments from Geert and Michael

One more nitpick: The changes history should be placed after all tags 
that must be retained in the final commit message, and separated from 
these tags by a line containing just '---'.

That way, your review change history will not become part of the final 
commit message.

With that said,

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>

>
> Link: https://lore.kernel.org/r/ZkjwzVwYeQtyAPrL@amaterasu.local
> Cc: stable <stable@kernel.org>
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
> ---
>   arch/m68k/amiga/config.c       | 9 +++++++++
>   include/uapi/linux/zorro_ids.h | 3 +++
>   2 files changed, 12 insertions(+)
>
> diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
> index 3137b45750df..fa74452600c1 100644
> --- a/arch/m68k/amiga/config.c
> +++ b/arch/m68k/amiga/config.c
> @@ -180,6 +180,15 @@ int __init amiga_parse_bootinfo(const struct bi_record *record)
>   			dev->slotsize = be16_to_cpu(cd->cd_SlotSize);
>   			dev->boardaddr = be32_to_cpu(cd->cd_BoardAddr);
>   			dev->boardsize = be32_to_cpu(cd->cd_BoardSize);
> +
> +			/* CS-LAB Warp 1260 workaround */
> +			if (be16_to_cpu(dev->rom.er_Manufacturer) == ZORRO_MANUF(ZORRO_PROD_CSLAB_WARP_1260) &&
> +			    dev->rom.er_Product == ZORRO_PROD(ZORRO_PROD_CSLAB_WARP_1260)) {
> +
> +				/* turn off all interrupts */
> +				pr_info("Warp 1260 card detected: applying interrupt storm workaround");
> +				*(uint32_t *)(dev->boardaddr + 0x1000) = 0x0FFF;
> +			}
>   		} else
>   			pr_warn("amiga_parse_bootinfo: too many AutoConfig devices\n");
>   #endif /* CONFIG_ZORRO */
> diff --git a/include/uapi/linux/zorro_ids.h b/include/uapi/linux/zorro_ids.h
> index 6e574d7b7d79..393f2ee9c042 100644
> --- a/include/uapi/linux/zorro_ids.h
> +++ b/include/uapi/linux/zorro_ids.h
> @@ -449,6 +449,9 @@
>   #define  ZORRO_PROD_VMC_ISDN_BLASTER_Z2				ZORRO_ID(VMC, 0x01, 0)
>   #define  ZORRO_PROD_VMC_HYPERCOM_4				ZORRO_ID(VMC, 0x02, 0)
>   
> +#define ZORRO_MANUF_CSLAB					0x1400
> +#define  ZORRO_PROD_CSLAB_WARP_1260				ZORRO_ID(CSLAB, 0x65, 0)
> +
>   #define ZORRO_MANUF_INFORMATION					0x157C
>   #define  ZORRO_PROD_INFORMATION_ISDN_ENGINE_I			ZORRO_ID(INFORMATION, 0x64, 0)
>   
