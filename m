Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5916340280
	for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 18:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993089; cv=none; b=qvH7TRIk4ePGFjG4DjM14+RtgEyArgvCGcQXr9N7qRihrEDSodj+YNOz0tzJJnVz+NklLfbN9a0/pgyDQnJ4GujI2IdB1yk4GzxZLZg9H3yEhhHXJSL4voRm8SZKiWx4QcOgp/K8vnDmC8J4cxt13JoabKtEAgyPJGZL1sAvuWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993089; c=relaxed/simple;
	bh=TMsvgniavUlOv25EryjMgzq6nXmui9rVUX/SZsR5B1w=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OkXWdkZnH36UBhA7+cmoHaGurc6BUGIv4MHiNLArDPhTx3TQHulgx7UvVTdP3sbqA3yvRfntQ5zyeV4nhDQWOUF1ZEy0wEj4vb2C+opsO59+dz3ffpoA/F8Bo7dPnggOOJXJ6CqhhIghvtMGYAWDAr/AhD1KQmh5bV5SL9edXRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lO/00eeS; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lO/00eeS"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6ac83a09781so144082eaf.1
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 11:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786993086; x=1787597886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OItvtQ/xwR3ysagLsVVnnXaKTcG1LCueR92cJBEdgRk=;
        b=lO/00eeSTSUkMHw5DW3qSrcR35zZ0mvZGBPZg8/tpPso8PefBaG/WEO/QzCEf1+TkA
         Fx+/+W53g68M+bKoLtbefJGvkiUdqIfS4mgL4CzK7vlfnPxOE4dlzfXT/fgizXBD8vdq
         QrEgwZXpdlfXrJOc8JKPsHAIJiYLFcVVzLCDb1Sh5WPnWjJUr4Zja2DKFVmUicoks9wZ
         Q8snd3PoWN0PUB0MHh6NE5OhxlTUK86kbVS1yYT/YnyXt007Te7MwEQtPBPRFDZZmbEa
         J32eKYqJypT+GNKhFwohOeIrUaprf8K5AFi8W17f7bIEIl/TIjk/EJqxpqIRu2T/7xrW
         QZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786993086; x=1787597886;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OItvtQ/xwR3ysagLsVVnnXaKTcG1LCueR92cJBEdgRk=;
        b=obg6a7otsqXhED9n0bqQ0VqQR1d3kjOpD6QoPD4UbtObZbqQ2rUycKvQUncLXCqRrG
         3dOmbb6Q7HUNuJKPtKa6dU86khi7EgbjxagkTG6/HFH6ntZJgd+QBdiuirVz65s9N4cf
         E3U8i3TC1Mee9DcVbJsauSO5U7QVBsbFGgK+E0Ic89+f6M9AE55M3XybeN0rGJvaODDT
         3b3TWkbArX2GQWd+UXIOFHCpkY40t+PnRrjHBvOkmkPmAm21Kbys1qNqkaQEtjo1SkNy
         RIZzTBBUwbRafXdpHWrm7WEd8JLD59/qkATkt6nJpcoJw7aV42kzJ/0tzOak6eqnQN/S
         HU7Q==
X-Gm-Message-State: AOJu0Yzecmy+tUW3dZC8T/wpoAgMTb7Urvp0YDwgKZaOMyAZeqCi/Jy6
	hQqxYfL0GB15kr7FAcTVIGqYVgX3iQ1PRVDLk9EjW0H01zoE1wqEnhrWENG11A==
X-Gm-Gg: AR+sD12sHj0zxrKbG2RPJzsTZuYQ5nZUcA4ctE+2MUX3LKV5zU7vcwuB/63OsmSz+AC
	UwL60HDoLWHfLO0SvC3ua4TkgrjQ+wncozak3FVJGVgaJv7e5DebNEbsH0UNt3SP/VNTy8wIhus
	u+0MwcYDYyQ/eRJ8heVJavtqASwP/QXLmYYCGH3MDH07uVk2pRg5HFoWgHUBuk7ZRATw/sEA8Ou
	a46VlmASrlrBUaJNwp+x4OR0BSLWD0xfW2ZXCbjwUQQLDsMLdmolMWuEwXSQEHarPzn+q6ztude
	u5JoZ2gGBIjoqZR+GVtG6fcrtj55M8+PQ/seZ4858OZhpnrp81mPCYZdzIcrmPrg4pHfCNCEmdg
	MsTEN8ZpR1vMfEKr3FbBsCqFeW04iP7sRS36HjnS1NY+34fJwhdDDVZE0Hcjj4W3UTa5Ck4Icni
	SvrKGyVsGzF8GhHRjmBGLvp60Dl3U1ApuWh1DD+ffh/DC3aw6iVYGZbNMDoLlW4mNDjoEVX6xws
	BMBoIpgCX5k76qGAr1Bq8cr
X-Received: by 2002:a05:6808:5188:b0:49a:72a:4e42 with SMTP id 5614622812f47-4b29b47ddd5mr873466b6e.21.1786993086495;
        Mon, 17 Aug 2026 11:58:06 -0700 (PDT)
Received: from [10.1.1.24] (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2960493ebsm1142694b6e.11.2026.08.17.11.58.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2026 11:58:06 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] m68k: Add support for Svethlana
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20260816073752.16656-1-schmitzmic@gmail.com>
 <20260816073752.16656-6-schmitzmic@gmail.com>
 <CAMuHMdXPiizRPkT3ukiNoc-26dnqAKgkomsR8mYNxqSyh5bQ+g@mail.gmail.com>
Cc: linux-m68k@vger.kernel.org, Miro Kropacek <miro.kropacek@gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <94e542e0-af2f-aeec-e52e-28c4b31085df@gmail.com>
Date: Tue, 18 Aug 2026 06:57:59 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXPiizRPkT3ukiNoc-26dnqAKgkomsR8mYNxqSyh5bQ+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

Am 17.08.2026 um 20:52 schrieb Geert Uytterhoeven:
>> +#ifdef CONFIG_ATARI_SVETHLANA
>> +       {
>> +               int error;
>> +               void __iomem *sv_version;
>> +
>> +               sv_version = ioremap(ATARI_SV_VERSION_PHYS_ADDR, 4);
>> +               if (sv_version) {
>> +                       if (hwreg_present(sv_version) &&
>> +                           (__raw_readl(sv_version) & 0x3ff) >= 10)
>> +                               error = platform_device_register(&svethlana_device);
>> +                               if (error && !rv)
>> +                                       rv = error;
>
> Missing curly braces:
>
>     error: this ‘if’ clause does not guard... [-Werror=misleading-indentation]:

Oops - still does the right thing but just by accident ...

I'll respin, again...

Cheers,

	Michael

>
>> +                       iounmap(sv_version);
>> +               }
>> +       }
>> +#endif
>> +
>>  #ifdef CONFIG_ATARI_ETHERNEC
>>         {
>>                 int error;
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
