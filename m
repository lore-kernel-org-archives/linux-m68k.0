Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C327B188734
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063529; cv=none; b=hZ0YsdRA9N3pnIncSMQVn+IegH/eeRhQ2vnZv9+fcr7Hfm6bCOlRR2qPsANYD36w1Ud2+4KQIg+0Ly3W2cs/47Aw/rxT9dANDTGt5UQ4xeZ1k9/cdvwF5AyesI4NOf+UbSsBLQj+uNZSBd7J0j/5ftBjWUQXOQ6Vc6Mgls9tDfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063529; c=relaxed/simple;
	bh=tP0KD8mwbKtgEvBw3JOjxuTlG6PBQwFDYmtvgmlpVEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJxdIyTUOQsfSz4iUAK7dj4ec8tosn+QE8vqggGCus2WO93mKDykOj4YH8m7vAm8NPDQbUTp5YpyYz6SiQ0+sD42HCSYy8znmFyXQoNVMUazFRx38mmDevE5cTqmw8Zw47+C7IKzlv7qww0gXR0Gk7b30IGwFykw5lrMO9dTJ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5315ebfda19so274326e0c.1
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 01:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750063526; x=1750668326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSgP0LnXUVmPl4CjmcN+nPfjyJDxb5sQdSjITcwnsmE=;
        b=Z9bEEtKDK8Qo5vgKrXvrRMb1cN3jlI5yIWBlgn0hXg5nhr7/WP8Y8Q0BrBR/h695ux
         f7sv09vrzKhPsLZHoIbeiIHpx56c53+pHasLauvQ434p+ugOVJbvU3Mp4DNkbej2wZ06
         KK2XcavdginoDMY3XQijIcMFWCGM0o0IjvZFjeXwZk3bdNP8FvxYD382mU9+T04aZ5s9
         w8HuJ0d98sngvKNzUIVL8edhySCZipgSK/XNMGZNzZiuSKBzB1N3tynDiQjzsMHWqn6B
         zMYDwqy0XU79igN1PXGmiT/KDiePXAUAC1GwnVlX2FYKCf57u1wpDPycDEF+FbdkQf3B
         K7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSEVwy2Fy89BQfs8O+SrEDg8pmHV2Btpxpo4cKBDauZ8ktvzFVhu8N8+NqlVS0PSNpNOgHb8lA4W2T@vger.kernel.org
X-Gm-Message-State: AOJu0YxCcru/hNZB5a1BH6EJFp5ZMIS5vygHyn8Nv4OvBonY7S5P9iJn
	ot6+seyvzQh5xn8ycLxkehJgg3Y8PyeseWzbRvKL/D8GBNI6SdShU8UQfk6L+E6J
X-Gm-Gg: ASbGncvVt0YI0D+7JYXJTC/KVNqv3xV7JoMx31dpHClb4UZv5/HVd4RL2l+PLSZuE/k
	AFiJ86ECKu3IxzIKkB3u8Z+/qAYjbu5L9cZ2BIfDMJHowXbaLDHESpQOp5FmUFDDrdfVWaEISUp
	x7JRn0MPe/QoZuillnyKjTROsfH1me6ngslLwmh13LJDBRv4sH/NeO107DhGD7Nol1LHMNWJng0
	MZWSR8VXrwCEZF/p/wo5/C+lK7NrSDVkdTf3MNEK65q82+3LkxvhiVlvH4jKMt3HrMmYuf/fgQf
	/RNmi7sIaZSQ8Jg5jF5kI92pBmuVJBMqJjTU9T3rikrNGQhtPluyZ6Mdq6TNDGjVeFo959MX+c9
	+YPLBY6H0uaB15Tbv0txTC7IKHkvOtV4b80A=
X-Google-Smtp-Source: AGHT+IF9Dm1o8Ba4Y6K0iGK2Q6+FSuRt97YS95br48zTWcWJroF3Nh4yLw4uhj/n/LEb5QLC0xWaJA==
X-Received: by 2002:a05:6122:1b06:b0:531:172b:afe9 with SMTP id 71dfb90a1353d-53149927135mr5147326e0c.2.1750063525993;
        Mon, 16 Jun 2025 01:45:25 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313dd7a815sm1157988e0c.5.2025.06.16.01.45.25
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 01:45:25 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f234ba1abso134433241.1
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 01:45:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWl2tkN6sNu9r8/UYKb+l+Vdq89hIHF/GOsLE5Xdt1RMAwYl47o3V/dvGwtNV1krph0f+Brb2+poxNr@vger.kernel.org
X-Received: by 2002:a05:6102:2c81:b0:4e7:b940:4aa1 with SMTP id
 ada2fe7eead31-4e7f625fb8cmr5377848137.12.1750063525301; Mon, 16 Jun 2025
 01:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi> <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu> <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu> <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu> <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
In-Reply-To: <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jun 2025 10:45:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUA9e4iLBdna3YPo8ng80q3F1KT7GH298_wgULPTdyE9A@mail.gmail.com>
X-Gm-Features: AX0GCFvxWtrj7w4zqqd0BwxDX9tDEme8CpDDhgnXMa3aRRSh1UwNm3syUJ76q8g
Message-ID: <CAMuHMdUA9e4iLBdna3YPo8ng80q3F1KT7GH298_wgULPTdyE9A@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Laurent Vivier <laurent@vivier.eu>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Jun 2025 at 10:33, Laurent Vivier <laurent@vivier.eu> wrote:
> Le 16/06/2025 =C3=A0 10:14, John Paul Adrian Glaubitz a =C3=A9crit :
> > On Mon, 2025-06-16 at 10:00 +0200, Laurent Vivier wrote:
> >>> Could you point me to these packages which assume 2 bytes alignment? =
I'm genuinely
> >>> interested as I would like to put these up on the wiki. So far I have=
n't found any.
> >>> I have used Debian's rebootstrap to create an initial set of m68k pac=
kages with
> >>> 4 bytes alignment and didn't run into any problems yet.
> >>>
> >>> The Gentoo developers have also successfully created a chroot with 4 =
bytes alignment:
> >>>
> >>> https://dev.gentoo.org/~dilfridge/m68k/
> >>>
> >>> I have tried it and it worked fine for me with qemu-user.
> >>>
> >>> So, if there is any software that is incompatible with 4 bytes alignm=
ent on m68k, I
> >>> would like to hear about it.
> >>
> >> qemu-user is one of these softwares that know m68k has alignment of
> >> 2byte. All the structures translated from the m68k chroot to the host
> >> kernel are with a 2byte alignment.

The Linux kernel also knows m68k has an alignment of 2 bytes.

> > And yet it works without any problems so far. Please try the Gentoo chr=
oot yourself.
>
> Because most of the structures are correctly aligned by default, but
> some of them not. You must run glibc test suite and LTP to be sure there
> is no regression.

Indeed.

> In QEMU, alignment is defined here:
>
> include/user/abitypes.h
>
> for m68k the values to change are:
>
> #ifdef TARGET_M68K
> #define ABI_INT_ALIGNMENT 2
> #define ABI_LONG_ALIGNMENT 2
> #define ABI_LLONG_ALIGNMENT 2
> #endif

Note that it also used to have:

    #ifdef TARGET_CRIS
    #define ABI_SHORT_ALIGNMENT 1
    #define ABI_INT_ALIGNMENT 1
    #define ABI_LONG_ALIGNMENT 1
    #define ABI_LLONG_ALIGNMENT 1
    #endif

and still has:

    #if (defined(TARGET_I386) && !defined(TARGET_X86_64)) \
        || defined(TARGET_SH4) \
        || defined(TARGET_OPENRISC) \
        || defined(TARGET_MICROBLAZE) \
        || defined(TARGET_NIOS2)
    #define ABI_LLONG_ALIGNMENT 4
    #endif

which will probably become the next victim of the 64-bit little-endian
natural-alignment monoculture...

> And there will be a problem with binfmt_misc because we can't rely on
> the ELF signature to know which qemu-user to run, the one with 2byte
> alignment or the one with 4byte alignment?

Exactly.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
