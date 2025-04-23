Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3755261573
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Apr 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422969; cv=none; b=nzwrsVLNWvxxITHBwkyFx4c0v6aDowZil/enOj09391pz5fb+pqcZpILUen1Za0TyfLp8YowZQPvfcNP5jR/uFDmK8iq/4cbSpa1DSOOn+/vgme6cvPnha5Ftd2rnUs8JLj0C10lyGc162SPsCPh/0dzNIxaR4BNBKTXCMGwRo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422969; c=relaxed/simple;
	bh=7tJsF6LTV2TN3xVlVPySpHErvRYqqLVyNgQr13rzef8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNNqOQ+gEIB27JnIU0ljWHjeclKCnHfpYPhDyiFE2eWWgs0Jljn6ez089bMUnVtezr5Z00+sIkNWlEdhfMl+omNDm66BLolSkdxgxtVbCpygWlguhr/D8nW3OrFnqz7TDkoEJdI7vjNmS4gmKtEFuJe95ADhR1nFlO3rB4pvXUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lB5E0y+6; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lB5E0y+6"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3085f827538so25746a91.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Apr 2025 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745422967; x=1746027767; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msbxwaw4dDDTGBYZH73Q/F51Kg6OrIx7Df//23DLu30=;
        b=lB5E0y+6rVg+uRvPDIHmPlby4A/ygzznJnKy/mwQdD8ezIiq3OYbPFdxnL3jqLsJRi
         DIQe7BBJ+weiczqHSsoRc345XCbUKS9GGBXuNcvxUc0/lAkur+tQWnAqppOW2X9CeVV8
         0hg+qZCCOfXEa9zxt/aOfkWhHlHBjRkgtkIpHlww56IBGtT/05nOCBEcqCyLHP6S4xoX
         2K8RdXhPZtpWu7Eu212Y8Ly2mju3FkpdN8xjQ7SrAYW9aQNSSyUlyu3TO560xN1Kbv7V
         i6wwVkRrq051OnWfafdDtFUq2gDmeCIreRXtvY7m0NGyzMLN+uygpVrJ3IWnf1ByKtBG
         vBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745422967; x=1746027767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msbxwaw4dDDTGBYZH73Q/F51Kg6OrIx7Df//23DLu30=;
        b=ZtSX2D1/Uw1i14AQ7rWeuMPwmh9ENgZ6mfDkn1tpccKYqZnFyhdCs6M0rlEFIgRYQU
         Y8XaYe2VeVBMzvSTWvYfsA8PpemXeTS6WtL3WHs7zl+hSUM69wFOuTrpcgcPDms9582W
         z2gOzGMnuep/0ZFdGuZ3Vu+FislxiCzRPfwzOQ6Jua/crc5917dTWtMJPwBHoGLh4kqK
         0in1VOjHiyVLuuHKmAkiILwlgyHd1HE1mCPD4Aut845F0pKen2z/A0f+Rt50Z89ML0av
         +g1Qjhb5Pk7Cvqo+ndSx7IhgNhML1m97MExcaQ+IZmMA6fhiMIbtEyjI1ekmOk4Kkdxa
         I6jQ==
X-Gm-Message-State: AOJu0YzlFrtrK4BZmJrOdhN33bTKB2rHNkz7U92rTJmGKMXuq0MjInxg
	ICoHCu5EIsq38taIbh00RnUbNIoPMvqArSXIK1uIvQYQX08Vqe2RNKxypAPS8ytYUweW+wFmAsj
	3cl+nrlAlaov7Rwo2PvOaJksLkqU=
X-Gm-Gg: ASbGncuXnzBAbLRvfnbu3Yc/iaLkV5o1JuP1NoSIUEm/7sTFWenPj77+WvyNje2SWeZ
	W2eWRudSQjxO0WCTd8Q9877mAlY+SOdIIWKBMReHCyesmD+mKK+bTIyC7K4N05eU6YtyGLY6akH
	y00AGXHSUSsF2qoK4ULnPy19Y=
X-Google-Smtp-Source: AGHT+IFZAwM4sun1dByESMz9CCH4BRvNFnr7EdDKA4KFW/W/IXm92EgPOGJEwqSAjcoHJrRZJOQb2RUUdD9tovhhKBQ=
X-Received: by 2002:a17:90b:51c7:b0:301:1c11:aa83 with SMTP id
 98e67ed59e1d1-3087bbad714mr28423963a91.28.1745422966840; Wed, 23 Apr 2025
 08:42:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417201013.46384-1-shankari.ak0208@gmail.com>
 <CAMuHMdU9w8dc5T=0B7mECJhrK6ARUiGjJ3EG=0-BR9gbJm-XPA@mail.gmail.com> <CAPRMd3m2UmfPrzD2eXW9s_Uc1kM4cwCB4pMAbSSPX+MB85=H=A@mail.gmail.com>
In-Reply-To: <CAPRMd3m2UmfPrzD2eXW9s_Uc1kM4cwCB4pMAbSSPX+MB85=H=A@mail.gmail.com>
From: Shankari <shankari.ak0208@gmail.com>
Date: Wed, 23 Apr 2025 21:12:34 +0530
X-Gm-Features: ATxdqUGH9CdkJKB6goaoFyitsQC8r0g5JhLDAHlfP0EkZbFXT3xuVoFnNFVR4do
Message-ID: <CAPRMd3mPw5+_wt4HAr-5SHXLWXCFBNqKBj1phE9d52_GBHr_kg@mail.gmail.com>
Subject: Re: [PATCH] m68k: replace deprecated strncpy with strscpy
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, jeanmichel.hautbois@yoseli.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the quick review and for pointing that out!

Apologies for the duplicate. I'll make sure to check for existing
commits more carefully next time. I appreciate your time and feedback.

Regards,
Shankari


On Wed, Apr 23, 2025 at 8:49=E2=80=AFPM Shankari <shankari.ak0208@gmail.com=
> wrote:
>
> Hi Geert,
>
> Thank you for the quick review and for pointing that out!
>
> Apologies for the duplicate. I'll make sure to check for existing commits=
 more carefully next time. I appreciate your time and feedback.
>
> Regards,
> Shankari
>
>
> On Tue, Apr 22, 2025 at 12:23=E2=80=AFPM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
>>
>> Hi Shankari,
>>
>> On Thu, 17 Apr 2025 at 22:10, Shankari02 <shankari.ak0208@gmail.com> wro=
te:
>> > The use of strncpy() does not guarantee NUL-termination and is depreca=
ted
>> > in the Linux kernel. This code manually terminates the buffer afterwar=
d,
>> > but using strscpy() is simpler and safer.
>> >
>> > This change replaces the strncpy() + NUL termination pattern with strs=
cpy().
>> >
>> > Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
>>
>> Thanks for your patch!
>>
>> > --- a/arch/m68k/kernel/setup_mm.c
>> > +++ b/arch/m68k/kernel/setup_mm.c
>> > @@ -243,8 +243,7 @@ void __init setup_arch(char **cmdline_p)
>> >         setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _en=
d);
>> >
>> >  #if defined(CONFIG_BOOTPARAM)
>> > -       strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>> > -       m68k_command_line[CL_SIZE - 1] =3D 0;
>> > +       strscpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>> >  #endif /* CONFIG_BOOTPARAM */
>> >         process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
>> >         *cmdline_p =3D m68k_command_line;
>>
>> The same change was already applied as commit a7130910b80753d5 ("m68k:
>> mm: Replace deprecated strncpy() with strscpy()") in v6.15-rc1.
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org
>>
>> In personal conversations with technical people, I call myself a hacker.=
 But
>> when I'm talking to journalists I just say "programmer" or something lik=
e that.
>>                                 -- Linus Torvalds
