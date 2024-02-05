Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077A91642C
	for <linux-m68k@vger.kernel.org>; Mon,  5 Feb 2024 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707128157; cv=none; b=TWkkUi4C8N/MzVKeqwafR0mgiq5GN+QJYbMbz1f3nWrsl50+vLx1a3SnNtOcRjX7GeJMdmksK2tSQRw1bLlzC1xTqB96hEXODwzua844D0cHO302hUnQ/SkKyzayX9rmdbckqa3hpMmVEasTbjCTrX5lUMH+rGPn8YU1hcrTBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707128157; c=relaxed/simple;
	bh=Lp3p2se+fMTd/N62nTG3CJYIQGpyN+WjbC2OxPPduXI=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Ng/OpIvpBSS3DmsiSSECXAAv6yaD8Evivyl3ey2+WCtRM3nzrqPad/e31edaNlFtTrkNkVf/zbLX9/Kp33al9IUp2LfAXWIwsTtYD/PO9eU1ENqtUvT1giZGYH2aGEn3jyhX+y6m0kKoPljQvcMjncP7L1vN/bKkPQbBkYbcs2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kS4hjH1P; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kS4hjH1P"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d9bd8fa49eso3619915ad.1
        for <linux-m68k@vger.kernel.org>; Mon, 05 Feb 2024 02:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707128155; x=1707732955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjE1TlwXB+I5nYy9409tVE1mmgPk+yM8QPy/U5dCZJE=;
        b=kS4hjH1PxkmNHnm65b2bq8j/iDIQJd/jlqwBeHEg3djljbaHqtHIxEXxn97U6gHPNr
         IPKTPVNMSOHaGrglmA8LqShf6Jpjx176Wx3I1ZNYx03K2L6qYfWqxezb3ZGxGY7jWUMr
         bGgiz3kW0oQ9m/MulfIuzyhB7fNP5gVdgpS4zJ7dGE/Vu43pvbOLsisxFxvGEbLuxarA
         sYjoFMB26zqQdJOJLrJVUgvQKHI1Yx82YpkUr65ggGUhBAJ0E129Nf0whK3fdVsXVdBa
         Ic1p1i8dJGmMIy/yv3KtVPm0tponXM+WTTUAjG9PghwRuri+A9xbofzi5SXbgDpbBf+G
         gTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707128155; x=1707732955;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SjE1TlwXB+I5nYy9409tVE1mmgPk+yM8QPy/U5dCZJE=;
        b=ndMeVy1Ofj5zdG01s6iHJU+PIrZWtTmNyo2WIll9/atrTHaeYap53njbbZSdGv7TAO
         KeQvO2vU2Jnu9RqGfIMOvHKq5zrXWyBcCQ2aWekV9DxWhPWmKuzzGMLh8aOeu6xlbW0k
         TRjwxBzVY7WGFafGBGTGIC4TTx1uClmjx7NnSgbmfgaMiTpEBkoPtnSakPAFfnXWPmUw
         twS70kJSzyRTltM+wvDzWOtUM0b79AqnAso2hQbtjjUIxEgPe5gKS+17dcVacv0F/mZK
         2o3TZWiMh4YxendngwTmap5P6pXsa3qd0apcwMVkBsNAT8ZIgwjbCGdEP0dMdx8T1MLG
         GePA==
X-Gm-Message-State: AOJu0Yx1pRKJCPogXAWdaZtlSDY37ade/EqYk+uoZg6FNhCN+ifUuGAa
	8CY25M/ZTh1l6Nh+YRc/A19YV3SpO4MVHOxesgn5XJpOXfeDUvcj
X-Google-Smtp-Source: AGHT+IFhZOuaD4oUwurG1JrhJ4v4Va4wTmRTnvGBjHzA4Z0GX8p/LnHsetws5wacSicPA5WXcsTiRg==
X-Received: by 2002:a17:902:ce82:b0:1d9:af60:a7e3 with SMTP id f2-20020a170902ce8200b001d9af60a7e3mr3021472plg.27.1707128155172;
        Mon, 05 Feb 2024 02:15:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWa2QKSDOq8HgEEqi23IObgB+zJs4tIMLhMXQVLHgqjgdX+dbGh82FrKgW1HxBItT+xR270E+qap2mJ3BH33wc00y+PDVzSmNEHjgI1ccwJzk0wpmw6e5vZfTZg1CZ27iOJmRrC6SDqd9F+EU0=
Received: from [10.1.1.24] (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id kh3-20020a170903064300b001d9609f2e30sm6023303plb.1.2024.02.05.02.15.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Feb 2024 02:15:54 -0800 (PST)
Subject: Re: [PATCH RFC v2 4/8] m68k: Handle arrivals of multiple signals
 correctly
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20240205023236.9325-1-schmitzmic@gmail.com>
 <20240205023236.9325-5-schmitzmic@gmail.com>
 <CAMuHMdUMwQSEwDQ3tsmChutY3P0VQUA0A8jg63NxfyrmxfKWXQ@mail.gmail.com>
Cc: linux-m68k@vger.kernel.org, uli@fpond.eu, fthain@linux-m68k.org,
 viro@zeniv.linux.org.uk
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <401b6911-e6ed-3e9f-9dcc-d4f951c6beef@gmail.com>
Date: Mon, 5 Feb 2024 23:15:48 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUMwQSEwDQ3tsmChutY3P0VQUA0A8jg63NxfyrmxfKWXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

thanks for your feedback!

Am 05.02.2024 um 21:10 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> Thanks for your patch!
>
> On Mon, Feb 5, 2024 at 3:32 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> From: Al Viro <viro@zeniv.linux.org.uk>
>
> When submitting a backport, please add lines like
>
>     commit 4bb0bd81ce5e97092dfda6a106d414b703ec0ee8 upstream.

Will do. I did wonder how the original commit could be found to prevent 
duplicates...

On that note - Uli: would you prefer the entire backport series, or only 
those you do not already have?

>> When we have several pending signals, have entered with the kernel
>> with large exception frame *and* have already built at least one
>> sigframe, regs->stkadj is going to be non-zero and regs->format/sr/pc
>> are going to be junk - the real values are in shifted exception stack
>> frame we'd built when putting together the first sigframe.
>>
>> If that happens, subsequent sigframes are going to be garbage.
>> Not hard to fix - just need to find the "adjusted" frame first
>> and look for format/vector/sr/pc in it.
>>
>> MSch: Minor v4.4 backport merge conflict fixes.
>
> Please move this to "[MSch: ...] below...
>
>>
>> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
>> Tested-by: Michael Schmitz <schmitzmic@gmail.com>
>> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>> Tested-by: Finn Thain <fthain@linux-m68k.org>
>> Link: https://lore.kernel.org/r/YP2dBIAPTaVvHiZ6@zeniv-ca.linux.org.uk
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> ... i.e. here.

OK.

>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>
> Good.
> Please add your SoB on all patches you handle, some lack it.

That would have been the ones that did not need any extra handling. But 
I take your point ...

> Thanks a lot for taking care of this!

No matter!

Cheers,

	Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
