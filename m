Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC440241103
	for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Feb 2025 18:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739037656; cv=none; b=ZB6g822FPmXYOVrNDfBGOAJ0EoLs3o9YBiyNX+GbArX0pZ3uEwAJOkneUOVC13808t7KpCgAAQF0Q2dP3pA1X40cNt4fhul82+eFQbtO6iDNEvBbBZB3OeZNj7WVZemFh1Vsp9Ep4MewYqpVQbMnrvwaE1zuyNgQUqhNYnbVCoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739037656; c=relaxed/simple;
	bh=yPi01lgbmAIevC6u+JmsTgYoSkU/wFCQ44YinEUjDL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaqFBPyYd5h69dIaNJEbOPUMBBEynFwtOFKCzNsHVVy9ItDw7iIX1tlvymnydS1Y2dvQuvC1S74yfGcIP99651hHMkg4jE4vIPOLM9EIYg36Hxxpm1VpvnQbzPQ6tCp2h+rfrwFUbiSq0xDlZVHKbYejhs8a4C+qidE2tL66DuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbPiZIyM; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbPiZIyM"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f754678c29so27165147b3.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 08 Feb 2025 10:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739037654; x=1739642454; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ50So012NUKYlUWEsNDmQqC2zUcRpvTKx1dhgNUOYI=;
        b=jbPiZIyMF2lsi3t3fOV4kXXZ2ONL3k75sqW9Yz2VXcEoPoe4Rz6BMNnhCzfyLt55WI
         L/4blGjiUG0F4D7+OIvIWgQX43WvenOuJie4W+wPSpMy0wMTGR5uycfeZnzjg9FRov3y
         OuSlTnLARxyzrAdA7e8Y2LfyquX/6sNRFws478eb+53qFmc7egol3iCQJDsVj5frkjnS
         hCJc3ndN1C3puWHLjPn3rOGvTr4XtVKW4O6voHEO++5LgYoDTprVjT60QVkB2p8DQ7Nk
         AHJXXLF73rkNNZKupUGHmu9kRg4MS2kGOBFGfHMS3YoddKZeza6F/BcRRS3td65AobXZ
         3CfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739037654; x=1739642454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJ50So012NUKYlUWEsNDmQqC2zUcRpvTKx1dhgNUOYI=;
        b=K4EUnpObHUq1Tbvxj94fcLMGtnUhTew458qiO6lx6YBAiyrcqxuXhzvdKf9ecszMHM
         kFUd+fddaBv82U32Cf5viXCchI23FE5X0ToZSt0radyz5TWFivnh97kyJlcplterdLD/
         Ylg5Yp2ukVEEbS3ansbhamuyoSQy6snR6Yb+HxiZ/PvrrZ8D4N4SkeSjLdE874r91OJW
         4JS+4Hc8trZjq3TwWOshYSkHA62OSsPM6xNQujGiVfu2x2ZKLqgETUkEoJ5W0CZGly2p
         wQ6RWsWbO0pQs5QRPhI5/0TUIiQFB+TkY4kushHd1DOZ0iYIGo+MTSJsW/z9w5lDqY0i
         W89g==
X-Forwarded-Encrypted: i=1; AJvYcCXFhOYj+emtY7tEMhze6oQfwAcMHtHUtbIi+pb9Pfvm5zYJ6EOkd93ohGAwPJNwSeDPMwsHFDNH+Apy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw0mK2idzuYaB2A7fMVpWKZz/PJpNVj4x8+CcjCFi2YuE56SOu1
	Id3/62doVyxLYkU9Oob4RW0Lerz/ZJ0qidfz0ABf9bdnewf7sN1x
X-Gm-Gg: ASbGncvJYnJts4FIW8nBnmdxr3984kznE3w154Lah2zO45+ROM2SzZlwy1nzN5QxQlO
	i8TrU8yrja2D1x8brYDc41vOiumLy+qZkoCiSs2Slwu8US7I4WkD/BmKUA0A0wg8NwAh5CZD4XF
	5/1CbGEC3cSzNtg4msTHa7dW+dI8oALMAg+4HFB40flO8fk8MFlSbjuWZeD7T+yTPpXBba1ji9+
	Mko0oXCr/aprNgatxE6uHexya+H482buOSAGtbMRlhxhhEutl8ql+Fw5VblUszOC+C5uHqcFjkK
	EAZtvCnCff4zdmgv/LgItDPZb8TCBYRC1NuqQ8J1Je0vUTBvBNI=
X-Google-Smtp-Source: AGHT+IFRlIpmB/OwyomFOIGum1C1obghY8tVh4HH+993/Q5NYcDDdMOhv5rQxRMHdGz7A/w4A5DwlQ==
X-Received: by 2002:a05:690c:7301:b0:6f9:a3c6:b2e4 with SMTP id 00721157ae682-6f9b2a216a1mr71260247b3.37.1739037653938;
        Sat, 08 Feb 2025 10:00:53 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ffc0b73sm9596537b3.104.2025.02.08.10.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 10:00:52 -0800 (PST)
Date: Sat, 8 Feb 2025 13:00:50 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/3] bitmap: remove _check_eq_u32_array
Message-ID: <Z6eb0mO_U76CS83_@thinkpad>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <20250207-bitmap-kunit-convert-v1-1-c520675343b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-bitmap-kunit-convert-v1-1-c520675343b6@gmail.com>

On Fri, Feb 07, 2025 at 03:14:02PM -0500, Tamir Duberstein wrote:
> This has been unused since commit 3aa56885e516 ("bitmap: replace
> bitmap_{from,to}_u32array") in 2018. Remove it to avoid the need to port
> it to KUnit in this series.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

OK, 7 years is enough to drop it. Adding in bitmap-for-next for
testing.

Thanks,
Yury

> ---
>  lib/test_bitmap.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
> 
> diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
> index 65a75d58ed9e..c83829ef557f 100644
> --- a/lib/test_bitmap.c
> +++ b/lib/test_bitmap.c
> @@ -100,34 +100,6 @@ __check_eq_pbl(const char *srcfile, unsigned int line,
>  	return true;
>  }
>  
> -static bool __init
> -__check_eq_u32_array(const char *srcfile, unsigned int line,
> -		     const u32 *exp_arr, unsigned int exp_len,
> -		     const u32 *arr, unsigned int len) __used;
> -static bool __init
> -__check_eq_u32_array(const char *srcfile, unsigned int line,
> -		     const u32 *exp_arr, unsigned int exp_len,
> -		     const u32 *arr, unsigned int len)
> -{
> -	if (exp_len != len) {
> -		pr_warn("[%s:%u] array length differ: expected %u, got %u\n",
> -			srcfile, line,
> -			exp_len, len);
> -		return false;
> -	}
> -
> -	if (memcmp(exp_arr, arr, len*sizeof(*arr))) {
> -		pr_warn("[%s:%u] array contents differ\n", srcfile, line);
> -		print_hex_dump(KERN_WARNING, "  exp:  ", DUMP_PREFIX_OFFSET,
> -			       32, 4, exp_arr, exp_len*sizeof(*exp_arr), false);
> -		print_hex_dump(KERN_WARNING, "  got:  ", DUMP_PREFIX_OFFSET,
> -			       32, 4, arr, len*sizeof(*arr), false);
> -		return false;
> -	}
> -
> -	return true;
> -}
> -
>  static bool __init __check_eq_clump8(const char *srcfile, unsigned int line,
>  				    const unsigned int offset,
>  				    const unsigned int size,
> 
> -- 
> 2.48.1
