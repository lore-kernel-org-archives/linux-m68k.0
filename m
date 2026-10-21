Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792546919;
	b=KejQ12x8lBngNkvBAMUeN01E1CfZjI3NyBuxClUpDakCYi/aYkqT0flICFV2Ff33FDRp
	 ojgBKhbh6OZaNFd5lXctaVLTctNuAcgxX4Ai1x7yHRvk1+kXPKSImbbpjfUiVlFVimL6v
	 NHYyonk1fhVy9Msrs2DKUM0iay+q1QEnA3rVzTP54KtpjibxY/6+LfuSDMkqoCiloYxnp
	 aGDDP+VitfbWhEYtummci91xta2ESbJhLRXxmVA+1KcDV6avlLuVr17OJ+zzK4gKMCnOR
	 TbQhvM6O/u5drw376fZd+wkZ15NfDIrW+zchyeAQPQPJkfM5ihQUQkbJ3f/KKsVTtGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bEk7FecfY4nY2BV2BtdF4RroL7r8NrfcNW+Labz3ttc=;
	b=L8b+e60DakK8o0nXkdbog/4xrwTn0WMNGzdnWbP9DoDDHooETVegecWZi8ALO0GdYjig
	 RhuUIfP9AHsT94N9X+2dZg0w4htrUyhIXXpBQ4gjgDf9bBuBqWkWBBRdOBVvaGPJ9I2aF
	 4yLAMK8+LmVvhlbOmuU1MzgDpznqcNklSlEeughAWjR1pOYpxwtidi7mRjlrfFVpXtvZs
	 VDxK/3M5gkRn7X5cshyfSyeCIG7Bokn/hWUWPbrKizDyjuMqYJgLsxrUhN+M21GXeDupe
	 IRJ9StkQz/louWsPtV/bvFtdohppk+s4J2FBGHDzHwaS9Jy945xDgQ+DX17mOk5On2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MVBfjRxU;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50044606A31A
	for <linux-m68k@vger.kernel.org>; Wed, 21 Oct 2026 01:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50044606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MVBfjRxU
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-17bc533fda3so270462c88.1
        for <linux-m68k@vger.kernel.org>; Tue, 20 Oct 2026 18:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792546918; x=1793151718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bEk7FecfY4nY2BV2BtdF4RroL7r8NrfcNW+Labz3ttc=;
        b=MVBfjRxUKnJTPV2PbUgCrwO6K+tafK6pr315kXrirjfWGz0HxESZGdJkFkFw2d+aCY
         gZusa9//Cq3sm0YTnSxUybcFeRik8gNb6Mz8tb4uFW0Q0h0ueYFa3ATAyFOIrBR0xzpR
         y11eC3o47YA1l5CSdaU7cdaXQputkQ/2F07/fchjp4McxwtJOYs6fQDazoDN5yXaMRzf
         b20n7g54e/oF8h+TaVJqsGRE1ENHbu3fGCNlrEVnVnD4nD9LdeEZq5O4Iz+vbt39Kcj+
         6d1C2t9Y2kE3kJWUi1OlYHZbEoqSLpt4XtzMdLPnyuhuQAScR6WvBY2FivJ3tquuqQgF
         +I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792546918; x=1793151718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEk7FecfY4nY2BV2BtdF4RroL7r8NrfcNW+Labz3ttc=;
        b=dME7zZSgUxg0WXVTIZMuzF9PQ477Vmnh3MlKpbDnhuDJTVgvjb9fdIolykUtOcs2lV
         JIKWmFeGUk/TyfFa9JemosjP7vZCyPeaUtqa5bxISEqFmlrIxqsidi7o1q5cmzKQvGC7
         k9itUSPTaDdzPNA9rvjrnRZ7ZG2Mc9F0KumRtC77vuicCPgyPf35s0GxJHTKDfqiV121
         Bi1UpAQAkoo/I3PuMOm9jk+LAmzdtdQqh729w2TJgm8M7J3u4eqE70zl8GsWSSZZKuv6
         0UgDbFLOjp0HnJO0KR4QwCFWoqrQ7bmYjtJ8vWmMAlcIcp+IV4E/3bL3EMnTmfsFGJus
         RVMA==
X-Forwarded-Encrypted: i=1; AKwUvBwt/ZhCixiwxJrAan2+hSpMe3jZvEOT1GbYqGm/EcEXndLFtD7LfKF7xKXcK7Z+nkAEAiiaCmH0SO9z@vger.kernel.org
X-Gm-Message-State: AFq9FYKdU6KDIxw2mVDrsDIHuICpvzZC6fbrDZF7rnlRSvID9p/xvJyw
	2USyTlFFizNaMBs7KXElrCwhg42VW6Hvwa4EmwMp0KzMo055jgKj/a5nMQCOOA==
X-Gm-Gg: AYBFou3rTYUcBT6lI4eDWrllBKPQhFtumfXiZNBCrhUczVXmAMZFxlxOqYjHoZV6gh7
	QFMIL7BhK33WazKF3Oz1OVcqjxauPZsP9uwEiTsUVFoQEzcoBUrfbaKTWpo/FRv2N5xdR5jwEx8
	ObOT2Wxc84ckp2Gx/CnMyOL1j2U70czRhGHnyR/RSFPyyorJGppg7Ie1w9M6vjxNchxYKHrYVmg
	ossNEKFDbY/oqka59slIrr5JNpRfg31YPn59mGNVUALQjyrLD/q1bYFJQVDdK5NlvaYN0W/XBoi
	Gkh0U3TDIiGa+oG34tjwCVLDuLAWR08BWq2eu6BnRWxU9gzgSkBhwJ4ZqI2rFqQab/WGp+iAN5f
	s1v0ghEZuC6++iNUed+HxsDUZ3WqKU4ZVQ5zChBeypkIUO+r4e6xA9xx6z3vWzxHV4KSJf30hr9
	2eH7Ub4j+2CsUWABT3lXVEzYSGgz8hbkF4qKM9Fw5zVI+CXf4YuJyHEY0dwvvr2mOlN/9T1tetA
	e8Cu75F/2/XW3DX+lUr1rf5dRDwStMGqajDXsbs6pAJQXAv+H3VXwT6LZZygpJalqdP6KR/EVSz
	QZq3NxDfQukastTIHHi5yg==
X-Received: by 2002:a05:7022:eb55:10b0:187:cf46:4c51 with SMTP id a92af1059eb24-190a728a309mr818013c88.31.1792546918290;
        Tue, 20 Oct 2026 18:41:58 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm2072834c88.13.2026.10.20.18.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:41:57 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:41:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Miro Kropacek <miro.kropacek@gmail.com>
Cc: geert@linux-m68k.org, schmitzmic@gmail.com, linux-m68k@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] m68k: Fix atari mouse movement
Message-ID: <atgXH5V-q8fYe0u4@google.com>
References: <20260819222838.21256-2-schmitzmic@gmail.com>
 <20261021000338.2160223-1-miro.kropacek@gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021000338.2160223-1-miro.kropacek@gmail.com>

Hi Miro,

On Wed, Oct 21, 2026 at 10:03:37AM +1000, Miro Kropacek wrote:
> Kernels are built with -funsigned-char since version 6.2, resulting in
> the signed 8-bit position deltas reported by the IKBD being
> misinterpreted as unsigned.
> 
> Carry the sign in the type of the mouse interrupt hook. The scancode
> buffer is shared with the keyboard and joystick paths, where unsigned is
> correct, so it stays unsigned and is cast at the single call site that
> passes it to the mouse driver.

The hook receives the byte stream, so I would rather have it accept u8*
and then do signed cast for displacement values (and only them).

Thanks.

-- 
Dmitry
