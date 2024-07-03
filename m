Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9A01862A8
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Jul 2024 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720033372; cv=none; b=WeJ68TX2Z7xwX2K7LZIu8EzugEupPtNb6wwmxqogtGJV56Mwoo99CdkELF9O4GC9zi7DcxxRElggcQ8uxaFP7nGv4Af4BbS+YzEMWm1n/j2x5APqFPEM2ZaEofm4aMcppEOngcRfWA935ZvADa+kaBBpNgDvkK6YX6D1pVbrbvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720033372; c=relaxed/simple;
	bh=NCK07WgmJilnpjTCGxUktyi8UNtcBim7wUs73C1Aoss=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cogS/VOjnY+Sz6IwTAsMsPz7UqqA/EFW5ZWEjBaaHvu7OQUiL5UF9cYWmGZT7TPAmnmfpohS1Gr1TtD3scPf/7dRHnqDPCrJK3WXc0oJYE39GBTWULsE+dDX5piXzw2ismPHwuSumwqO+zQ/PBAIhkqTx9mKXrxbVZSDlGGKQMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=CF1y2mmd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="CF1y2mmd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fab03d2f23so44672275ad.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 Jul 2024 12:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720033371; x=1720638171; darn=lists.linux-m68k.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR2WZFpu9F/eyrknYOVvW0A0ylVQU6Yd0yqZ9Xzk2UM=;
        b=CF1y2mmd06pAx4xpMFmSv/nB0LXfn1aUrHQsmq0G4Tmi+FElK97tZcNjOn6rFEX9fh
         30nnepagkv9pxRniqWcH2at+RzYCaFlt8eTtGnG80ETohNnb9zWEF7AvuMFq78HDmlAp
         D6Ba1nU1/pmGdQXt+3mg8GylRp7KyVcPjQ1N4PocOTU9f3s4J1MWckNSwbdzjbNPhabf
         +srBM8LrI04m+c6jnZlxGQYh5QU4ZJdwEfP1xBj9XSIz6NsO0EFgJWZmcbmSUyNGzX4t
         /Ka89Em7mDPPCLsRtHkyhTwHhhWS3cHF5yPe/LjVAZx34MD5S2cmywpPLbTFQxdYS0Eh
         wGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720033371; x=1720638171;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR2WZFpu9F/eyrknYOVvW0A0ylVQU6Yd0yqZ9Xzk2UM=;
        b=B+CTCd7A+m/NhjiRPycKyKY+T8y62eEHZLfEtomnBkygzMef/Db7wyOInsLao6v4Yo
         s8DI9ShPlI4+7M0rsLH/KggjZgTgIB8st7/DSViKRfRyrlYV3j5Brjk7Y05pXlDtDHg3
         1oII5W9Z0+ZMPswP1tqLoC8rBaO+z/J90NqMyq+ny3f3uzHPY/8/43PlZ6fmPunsGuGA
         v8tieDRkBVa9OYtBJkBl5DibxEXMuvfj0zQc0x0EYEYDJOQHDfTO4i1u3X0OXep4zchp
         oB91WP+bVO2KFSWGeo1v5GQpnxzENHUYkbJx0re5sVG3nj2mT0FlKubWHzymELRR236V
         ud3w==
X-Forwarded-Encrypted: i=1; AJvYcCVx9iO+30fgizS8i7hP6si9cwqtDB8Ujpd7QSrvdDVzbgOpUOvG7443Ln6ZYQaXMHqCLxu0Z0aRB4KzKVQ3zQRslDehtM+yytswaq4PU6Ta
X-Gm-Message-State: AOJu0YzcHRzfluk5bNysiPFDYeyGKgwrxJ12uLGbib9XbVy10/sZzCHm
	CAZXACBVPkMAiyv5whjbitTS4VVC9iIFxuGWkRD0kaclE3vut3oOW4kuW6iNBuQ=
X-Google-Smtp-Source: AGHT+IHOXF6EBNQCbpT1v/yymwkerRoZt4wfhxb5Ia/193m68mpPf++GQAxANRbGvPnXQGS+XO5Phw==
X-Received: by 2002:a17:903:1c2:b0:1f7:2d45:2f1 with SMTP id d9443c01a7336-1fadbc7f2d8mr91782835ad.15.1720033370590;
        Wed, 03 Jul 2024 12:02:50 -0700 (PDT)
Received: from smtpclient.apple ([2604:3d08:8e80:cf0:34b3:a7ec:924a:312f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1596d55sm107100645ad.277.2024.07.03.12.02.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2024 12:02:50 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] m68k: cmpxchg: Fix return value for default case in
 __arch_xchg()
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <CAMuHMdVTqsqrDTKGTGoLd_3FPk9S6wX-qXYzipJ+6yW0q0L11w@mail.gmail.com>
Date: Wed, 3 Jul 2024 12:02:39 -0700
Cc: gerg@uclinux.org,
 dhowells@redhat.com,
 linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <21C8794F-EA8A-4C4C-A51D-DA7D6900CC74@toblux.com>
References: <20240702034116.140234-2-thorsten.blum@toblux.com>
 <CAMuHMdVTqsqrDTKGTGoLd_3FPk9S6wX-qXYzipJ+6yW0q0L11w@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: Apple Mail (2.3774.600.62)

On 2. Jul 2024, at 00:21, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
>=20
> Hi Thorsten,
>=20
> On Tue, Jul 2, 2024 at 5:42=E2=80=AFAM Thorsten Blum =
<thorsten.blum@toblux.com> wrote:
>> The return value of __invalid_xchg_size() is assigned to tmp instead =
of
>> the return variable x. Assign it to x instead.
>=20
> Thanks for your patch!
>=20
>> Fixes: 803f69144f0d ("Disintegrate asm/system.h for M68K")
>=20
> That is not the right commit.  The issue was introduced before:
> Fixes: 2501cf768e4009a0 ("m68k: Fix xchg/cmpxchg to fail to link if
> given an inappropriate pointer")
>=20
>> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
>=20
>> --- a/arch/m68k/include/asm/cmpxchg.h
>> +++ b/arch/m68k/include/asm/cmpxchg.h
>> @@ -32,7 +32,7 @@ static inline unsigned long __arch_xchg(unsigned =
long x, volatile void * ptr, in
>>                x =3D tmp;
>>                break;
>>        default:
>> -               tmp =3D __invalid_xchg_size(x, ptr, size);
>> +               x =3D __invalid_xchg_size(x, ptr, size);
>>                break;
>>        }
>=20
> Although this was not a real bug (__invalid_xchg_size() does not =
exist,
> but is referenced to cause a deliberate link error), it is good to
> clean this up.

Thank you for explaining this. I was already wondering why I couldn't=20
find the function definition.

Thorsten=
