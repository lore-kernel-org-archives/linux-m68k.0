Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794525393;
	b=lGhQ234fKbdnPVOH273hzPAaklb1xQHhsfzzC3z91+7cItbe4I9iPd5zvdiUOiwLZASZ
	 kURZ2bOgNfvIWWkU501kkLopXj/vuxoLaqX0XG+R9mahFIK803R2ytxtgS7QyVrz/jjsZ
	 b5DwlQHK7ddDRaU6AALN/x299WoCl/3jHU8bYDmD7VrftOSXTIVJ3DLay4Qvh7aWWm2YN
	 uU1efdvutCgK8e3I9rkxqPu79KDOmq1NsNHFSLf3dQWOpQQNi198XduA6VUTL0COM6oJj
	 9GXh7K0rjFA4iywJKijsi2tz9zRbDSrxLTeB3c1GhAne9cjO7sbVu43FebqATsu+FLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YCt6YKhP3iRu11RrkHzPffGw1/WrazJq8WC9GVsXVNQ=;
	b=ngaxNVPamTnay7iv3696mErC60u3Brz70Exkf1z6BKZagGs5vMi1B6H00d6GzkOqDW/h
	 gppDO4BPp7zOhFQXAeZwyP9jjqH07MlbmsLh2atzF/yB1O1palwuxeDN8lzux0s4MbuNs
	 ZYMTOQVCcrnJrtgT4trzWicjT0qYSNAyDzynclRxL09mOesyMxvXaLzw0OmLt3iHz3Cgu
	 xiPBYCtImEtS9ykUEityrZAICiNgSLfcpffCKxnxvgNiSMitL/TbgcLJoJ/Dg1FDlXoER
	 sUDWCVunAt568npOmPyU2C5TYvGq0oLVWlNMk9UentZc4pY7yc9pyB0N5SbTqvKApfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcqGLabY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E598606A321
	for <linux-m68k@vger.kernel.org>; Thu, 12 Nov 2026 23:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E598606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcqGLabY
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb628232d2so400848a12.0
        for <linux-m68k@vger.kernel.org>; Thu, 12 Nov 2026 15:16:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794525392; cv=none;
        d=google.com; s=arc-20260327;
        b=KxZUhYkDrA7klPb+Wk/0pmrFrgQZV4OzPNZOGJifSPS+s1yYsV7w9HHP09DuvqO5ZA
         wGSRKBBZWTqIi9AUVhSSjCyi+wiS7ZJTHVQqRw1xbVzfhLNK9KYM8vH72Jcyn50LELoO
         ggICEugel3J1ZYKQVWcmuwznlSNgSTe3NpbVzVLZCb2Rlka7jgGKAyeug6MtQBLZwHUN
         NV0jjkTI3w87j9KAA5i4dSzGJL5Siqzkrt+FlAvmuZUxzJP2CGA7MD3U9XEfAMOubWl+
         IENVy1k2mwjRexBEJceTJh94qZwL60fQ8tUIBxzNgpr0Eq7TvxNq2GTNEkW/lOTQDGSK
         HV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YCt6YKhP3iRu11RrkHzPffGw1/WrazJq8WC9GVsXVNQ=;
        fh=k3fWiTJKKlH2AfO0WKC+6ykTFMulmIFwVhD3AC83UAA=;
        b=VgF7UkZsgfA1R6GXORXQ8No1lyY2x6Mzg1CsWU8Fght01Ezthj9wYCx3mE4EqtAQ1g
         krJ6ginVHO39rj6VRBzYoNhy0xUaa934cf5vLrEekgqT0Cj12aio787Kk4GSAql8tGQ2
         1/MZxddYQaifFwFC4y0TcAhPvwkrkBkKqujxOptkWnNOHGAK4zzJNcqRf4U/peS+Qgmm
         6IUP+ClCf/RsrvRS5L83ZeYyTtSqKWKNzNvJPfUmozglByS+lSw+esatU3e54jl98IVR
         n9FIWiSvfndeENKvfn4SBt3bf3eiPunY803nIUa6wLAqtkOzRNc8kCUz3d/YfLP59PTh
         3Syw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794525392; x=1795130192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YCt6YKhP3iRu11RrkHzPffGw1/WrazJq8WC9GVsXVNQ=;
        b=PcqGLabY0qbX789utrbySNOrwQkNq2cB4pnsRIKpK69t12rvdji70sLBSBoeWWVn2s
         4wnlfOP61C6XJ3rRbulB4DxM+EKEpAsxUQSo2JA+aAxYWOoz1mPZUVZ7hYAoMjCqdJ+Z
         YlyR+c9G5ag0Zg2wP6Nd9y5zd2mDpQKWmwjvn5+gtyobt8SMhU21EB+Kqx+vQWXNATGA
         hG1zf6G5Ug69yuzP41e4rRz/RSKQwhpyqDt89pV90Qf0CvqQ79O/x2glhFYtrJhRgsyV
         dsgoM6sFjo04BhvOVgBFhX80gl5mDmtlPjqNuMYlfNz80/eO6cLtmjg1rj1qtj+qOvm9
         Un7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525392; x=1795130192;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCt6YKhP3iRu11RrkHzPffGw1/WrazJq8WC9GVsXVNQ=;
        b=hfH/zZ1pk7aDoXtqhLC6wWfJW1rYkimx1lrHbuhVj+EzbYm1mb0/gWbqFG4vpN8fdG
         GAnIxOl4P2SRRE4YaEk1dOLs/RM9tgyRAqCn9OlAY2FyzbFC0JTH0huYXOb3Fgw2QWjO
         yxhF574cs7HJtBJA+8p42XmHdAugnPkPkwiZ08M7X0wTF0Oyc30Mo1xBZquAeUt/HGjR
         t8VWFbyr0gbkPbJqBRpY+eqzUqpmMGCUNT6XtznViVr7OQd/ElhRWrzJTV3l8JEVeDhU
         Vip1UkQ01BP5zh9tJkPMCdf/gnGVG2itJJok9f0Nm8+L5hPVTWcceLgO8ABsRATBVvpj
         dvAw==
X-Forwarded-Encrypted: i=1; AL+hErEXABaP3mxx7VzsvwWMDZgAeBRkasPlMJ2jFixdOlFDM2/4crteROlwgDpsaNHVxbzJzT4ryrAWLwOE@vger.kernel.org
X-Gm-Message-State: APuU4Z+MB1ERmWNAj2QIJMy2UmG4N+kZpXK6wR9CMGOUJCviooE9M+Sf
	shGZHttHqUMqIdGg9S8+2mdUrPKvGtEIa4+pJbPe3qw7Y3ve6fgZKj69n30EQaX75CIzzMWfK81
	Phc8IBmiwx7B77xY0gtwBW62fshPdhLE=
X-Gm-Gg: AYBFou0NYVKuWHJ8zuO4nRVUbRFlzSzWmESmL8dFigeBnszAp/uGVrd7V8+L8xFKq+d
	dlYQ19TEGcFgQ13R0rop7pnB0otVAFcihmzenrlltXBifgbqieHwfFkwelGtg8U39KAglxhFf6m
	fXcp41zrZOHjfvrKBWUbw8o5UVCrDjaVmRyvG6EGISNBQ9mIimWvNxryCNGAeuXF+D15O4ZHb5s
	N+IZJRcl1+4NOZ9DHmBdEul9P2M8CUWcoHtZd8ffoTw/u7R7rL5TfRkhg7S6nZLX8S8OmRgC/89
	bLj74VeDekGgCU+xMWrp8As5rTVqpGbFUNCvqtRKHqa3Y2Ez6C+eNqhaof+9g+CpoegFZF0towh
	R7WRaRqhHKhB4VLDaevsE+pOD49DvG6oTaLuxWA/c2dgrgi11AB8MCMybtqXUvE5hSoI3lVEne6
	ZsidVC1b9G12XPYRuXisTSo8iaXX1MaoxQ+NQife/7XwimsQDmyZimE+V+oesbWEaGJjaSfUQnO
	gnEME4xnyNK5Urf3KKGZI2mSdNlkc0jpH3mY4u83QWOgd2V0NuMj5d3OOy5
X-Received: by 2002:a05:7022:2584:b0:196:d6e1:108b with SMTP id
 a92af1059eb24-1b5030e32e2mr1199073c88.10.1794525391639; Thu, 12 Nov 2026
 15:16:31 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021000338.2160223-1-miro.kropacek@gmail.com>
 <20261021022336.2232886-1-miro.kropacek@gmail.com> <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
 <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com>
 <atqTLxkEusWSS-wf@google.com> <CAN5rfbQWDTXZVyh8fDjxqRVO_HEKvWLC7Q_i-7aTtSxi9sWuSg@mail.gmail.com>
In-Reply-To: <CAN5rfbQWDTXZVyh8fDjxqRVO_HEKvWLC7Q_i-7aTtSxi9sWuSg@mail.gmail.com>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Fri, 13 Nov 2026 09:16:15 +1000
X-Gm-Features: AclHuK9omy7qW74EtahCV4gmD-m_X0i6pDAOWe6bsljrf0RlmsCYb8yPkvkcYRk
Message-ID: <CAN5rfbQr9wjnAZN4fitmCyZs_CGd0A37omicP3hfiH3+_SWahA@mail.gmail.com>
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, 
	linux-m68k@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Just wondering if there is anything I can do to get this merged? Geert
gave his Reviewed-by on v5, plus his Acked-by for the arch/m68k files,
and Michael is fine with adding his Reviewed-by.

Would you take v5 as it is through the input tree, or would you rather
I re-send it as a standalone patch with the tags collected?

It is basically the last patch to be merged from my "atari stream".

On Fri, 23 Oct 2026 at 10:21, Miro Krop=C3=A1=C4=8Dek <miro.kropacek@gmail.=
com> wrote:
>
> Hi Dmitry,
>
> On Fri, 23 Oct 2026 at 08:51, Dmitry Torokhov <dmitry.torokhov@gmail.com>=
 wrote:
> > Could you please re-post v1? Can't seem to find it.
>
> v1 went to linux-m68k only, without linux-input:
> https://lore.kernel.org/linux-m68k/20260814031745.17140-2-schmitzmic@gmai=
l.com/
>
> It touched only atarimouse.c, keeping char * and casting the two
> deltas to s8. v5 is the same two casts with u8 instead of char. The u8
> can't stay in input alone though: a char * hook doesn't accept a u8 *
> handler (-Werror=3Dincompatible-pointer-types), so the arch side has to
> follow.
>
> --
> http://mikro.atari.org



--=20
http://mikro.atari.org
