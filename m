Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1FA20DC3
	for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Apr 2024 05:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712293812; cv=none; b=f1h0xE9dIej2Smoy8zRiiDWuFLYpnPKMQxsdj/Myjuh7YJ6EzVkCu/RJ6gnVhO3Jo88xR9cFiqOzrUdOfjtwuyAau+FCstDUAuIEzV2JdWqbh232KztiZ3Ua68hayy4kiS8pXM2i44TNhM+O5T/DSMYXMR0KY4hjB0AL4tFZGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712293812; c=relaxed/simple;
	bh=NlMY98BD79lBdspG+ouG7M9punegC0XfPjsulWCNnW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSCbSQ3wXRrGZTv4joPxDrARuQVxrc6bNQQkhbXob/U/RVTXNBBdB4PTG68Awsu7+eNoWHlO33IWiJAuGVEDlN6xX8Su0jXmqPaO8NlNJMeR2D4mxtJa9L561zM9VUbOZS+7BRMz4tUYdexhYm4WLVfQ0ARdVjH+Mal4QZj4SX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E45Yf+rH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E45Yf+rH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a450bedffdfso233485966b.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 Apr 2024 22:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712293808; x=1712898608; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlMY98BD79lBdspG+ouG7M9punegC0XfPjsulWCNnW4=;
        b=E45Yf+rHJwR+laFaM/Pk7njx0WIeoMPAb0l1Tg47WjCtT9krfbG7JQg1tNfWBMmz+2
         loiVxhlLe7kWJwvq5U+oolscSlM+1wpjNQce9/OARGNpyZ1RUH46DYyoByQuSatmaPga
         ZxtMa+854jJ00fog+CBGY0k+bLt7DowuGamr2hrSa77MeURm1xvgK85ysRr331aG+Op5
         RLLfmw3eZ2OkMJAgrUDE75jzlRlGsKN+GE2gmyJOVujpSECFAp62ogutrg8lsz8CAyrW
         Ax4GqU9Fd9AHGHInpGWo+NxNv26QlAeappG25JJhP2CPx3iPdk2qm1cFRaV3w+bX5Iv4
         SmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712293808; x=1712898608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlMY98BD79lBdspG+ouG7M9punegC0XfPjsulWCNnW4=;
        b=mxvcR/ayxsT3ZJNOPdqlXEpBZtm5RAwIhLp8S+t6ivNoDH0y4yApf0Z9ChyFl7fPWb
         cVEpcLJ12IKGDov8zniWkf84IaFWGbJ63dPpG6+TMFnFqZ3rNWO8ekE15a0G6FEOmsj6
         AhJBUQlWz9j5O9T9rgUDpvWsKTQFpKN1+qsMPi4BvMzQ1UXILtnCS99oh4rJBQZMtCGW
         j2fDYzHBoZf1Ev0o3aVmoftpF4doZwE6KxyHiRkBgcfRV7jIP07GDfEbhzR4t2Xo06+H
         JLnkFGVweANnHcftgg1+jEDV7wjyklBPa7nonsQx8kMmEJcT/rc8+Cth4GgFXsXJVs4l
         uE9A==
X-Forwarded-Encrypted: i=1; AJvYcCUz2GzDItl0IkUauU6VGCJDhOJmp9Poyfw25yb8tMPOIvFWWnlbTyvl+chEl4jQzNb37A2zwrK/MlXSHFZPYqzdEeWRkvGMig/f/3L/XAPb
X-Gm-Message-State: AOJu0Yy5KPw+b0qe7X+r89M9s9+58G3DjzHo6fJ8EETm3eQr7QRBX9QF
	Rq9PgCADzVsvDAIRyW+Oh6z1P/1SaOAyDn+9SaO98eZCaCz3ZQlenDNZn3Wbmv6oEWnSaVEqWuy
	IKX5ytwq/xKpDZcri44C/+eg09Nc=
X-Google-Smtp-Source: AGHT+IFNALLC+cLIfNSKBkrLOWuswiELcg0iglPLHWgzh4Faj3pLvLFzDEWHz9/0AFOMJnrf3rlzgjtzvgyHYx2EFkg=
X-Received: by 2002:a17:906:cce6:b0:a4d:ffcb:1f4e with SMTP id
 ot38-20020a170906cce600b00a4dffcb1f4emr161016ejb.75.1712293807779; Thu, 04
 Apr 2024 22:10:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
 <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com> <87y19s7bk6.fsf@mail.lhotse>
In-Reply-To: <87y19s7bk6.fsf@mail.lhotse>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Apr 2024 08:09:31 +0300
Message-ID: <CAHp75VdM8HgvBJrN_GRXH8XGGdv3Npxg6GR13AW-70jpuU=QOw@mail.gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Finn Thain <fthain@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 6:06=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.au=
> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> > On Thu, Apr 4, 2024 at 2:57=E2=80=AFAM Finn Thain <fthain@linux-m68k.or=
g> wrote:
> >> On Thu, 4 Apr 2024, Andy Shevchenko wrote:
> >
> >> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> > > Cc: Nicholas Piggin <npiggin@gmail.com>
> >> > > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> > > Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> >> > > Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> >> > > Cc: linux-m68k@lists.linux-m68k.org
> >> >
> >> > Second, please move these Cc to be after the '---' line
> >>
> >> I thought they were placed above the line for audit (and signing)
> >> purposes.
> >
> > I didn't get this, sorry.
> >
> >> There are thousands of Cc lines in the mainline commit messages
> >> since v6.8.
> >
> > Having thousands of mistaken cases does not prove it's a good thing to
> > follow. I answered Jiri why it's better the way I suggested.
> >
> >> > > Link: https://github.com/vivier/qemu-m68k/issues/44
> >> > > Link: https://lore.kernel.org/all/1078874617.9746.36.camel@gaston/
> >> >
> >> > Missed Fixes tag?
> >>
> >> Would this be ok: Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> >> I have to ask because some reviewers do not like to see a Fixes tag ci=
te
> >> that commit.
> >
> > Yes, or you even may dig into the history.git from history group (see
> > git.kernel.org) for the real first patch that brought it.
> >
> >> > > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> >> > > ---
> >> > (here is a good location for Cc:)
> >>
> >> Documentation/process/submitting-patches.rst indicats that it should b=
e
> >> above the "---" separator together with Acked-by etc. Has this convent=
ion
> >> changed recently?
>
> The docs don't really say where to put the Cc: tags, although they are
> mentioned along with other tags which clearly are intended to go above
> the separator.

He-h... Documentation needs constant updates too, for one reason or another=
.
This is normal process and in particular Cc (rather long) lists needs to be
reconsidered.

> > I see, I will prepare a patch to discuss this aspect.
>
> FYI there was a discussion about this several years ago, where at least
> some maintainers agreed that Cc: tags don't add much value and are
> better placed below the --- separator.

Thanks, I'll definitely read this.
But I'm 100% sure the environment aspect and mobile device screen
sizes were not discussed there.

> Thread starts here: https://lore.kernel.org/all/87y31eov1l.fsf@concordia.=
ellerman.id.au/


--=20
With Best Regards,
Andy Shevchenko
