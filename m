Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B731BBBC4
	for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Nov 2024 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732807564; cv=none; b=d/rdpRKB+EBbMTthczu70bt01Bd4X30KPzE5WvHdL92RzvrDbPtakzgfq1n1uT2lvSImyupLquNte9vkE06bzBx6AtieVEfGtTkf4J4/nQumo2VO/mON8a+Wr54sVg5gx38IUrEaSrDla+V21H9jkIBCsygjdOXlHDiPhpLIe7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732807564; c=relaxed/simple;
	bh=MXd4l6+iQmQnfD3BLnMGFSdnuuNa/etFN+OYpi5oBN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0oIPhczf7Wl0uJz0Ox90EIACFrlWrdH6t8F1HTFu9KIIwt9pLpb3X5Fk/Dm64XkeI8DQe62edw7gn1xW8C3EgGRbyymfwQweOM/NXScShd9kKwfCDe4qW3IF35s0aMrmnLdGxhBeKEwxNTrJcwj4eEoWpZt2KHZPw2llFsamOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aGEaqMA+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aGEaqMA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732807561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXd4l6+iQmQnfD3BLnMGFSdnuuNa/etFN+OYpi5oBN0=;
	b=aGEaqMA+QA4wwA3W8lDxOKQLlYl22bjx0GySmUaFZBUkn0rH/g6Pi8fPJ1GaN52IbT2YbZ
	jAHXWnyBs+DAOjQcnPIzkO8eRgJSn/f8LNeeqIxcl10o9lnvOvlnDYhVtyM3/PYP2y/Rpz
	i+oY3FJ08MwtTx2tl9MatqiGagRKMI8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-YETsq3q9MbKgctW2U4w0Xw-1; Thu, 28 Nov 2024 10:25:57 -0500
X-MC-Unique: YETsq3q9MbKgctW2U4w0Xw-1
X-Mimecast-MFC-AGG-ID: YETsq3q9MbKgctW2U4w0Xw
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-53de4ded14bso737494e87.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Nov 2024 07:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807556; x=1733412356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXd4l6+iQmQnfD3BLnMGFSdnuuNa/etFN+OYpi5oBN0=;
        b=idC0DSTlATHAwP+ki0Q3MgNK+mHJGgJxPmDw95MTgKWINvx/AE6LsXobGAtcRzvfm0
         G28XjLXDPp+gPVPe31WHE+Olrrt0I4D3fzblSEjxzH066P7b5CIcEc2IjvZFLABIXj2a
         KCF2+6k4rHetSkEJ1EfSdzeftF1mDRnN2J592L7FrpLMQU74jHFOSZETWzD5niUt7Wxm
         Dc7kk+fMhYCBoULC436VOI6T3DDccfdD58+53ZaIG9+sVfnrqaoGaA5H6SPcRuVIY0XG
         Hx897hiFPEYfoVbrCMh0qu+qvlLyAoHHm4YSE6wjLK9Vx4/RNAJpb1P6IpkPYx7w5FYF
         E1/A==
X-Forwarded-Encrypted: i=1; AJvYcCVcTlRV+bn6+AMIRb+U3jGiXKG0nnojukLsBM4/EFtsHVVzrjA6X9tB6CndnV1edM8sZHG1xqTs0l/W@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwHZinPCvFeT5OJlRQM0/i+FeRz9AP3RmqUUmlV+yalwAZ3xyrc
	CBE7ry9NiZvUVpTdLTk/ilc6PoC+jAh/QyP1NfTMRAuBP+Eq5GjanmkyJx4XWVZjdl4ZC6x2wXf
	fvoeCcUSnHN58V8fWD+ofTc0dgU5EwO1FMim65J/VSNynsRvo+Vh4eEUJFme1f/arhW79TkIE99
	GgYh34L+BOx8QyscunGUh/u2Kns1PpepVYeNQxyXsM
X-Gm-Gg: ASbGnct267LeYEocE5RxvZKQ25tUcg7zRoBhk4ii3UVyse1XovbOXm90H7nflh0uBtb
	U3t2UL2kPLGgBhtjzK6GXkOWQHEp+i7Y=
X-Received: by 2002:a05:6512:32c9:b0:53d:eef7:a017 with SMTP id 2adb3069b0e04-53df00cf65emr5725106e87.15.1732807556119;
        Thu, 28 Nov 2024 07:25:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUDRgJvQYM+JdFcJ++bS15Z0GZU2YBr+5bjatsFWQinG+yirtbrqloo2N19HWJZBdciblzJX3Lg8Gg/26Guhk=
X-Received: by 2002:a05:6512:32c9:b0:53d:eef7:a017 with SMTP id
 2adb3069b0e04-53df00cf65emr5725087e87.15.1732807555727; Thu, 28 Nov 2024
 07:25:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
 <3a8f6faa-62c6-4d32-b544-3fb7c00730d7@yoseli.org> <20241115102554.29232d34@gandalf.local.home>
 <cbb67ee2-8b37-4a4d-b542-f89ddae90e94@yoseli.org> <20241115145502.631c9a2c@gandalf.local.home>
 <2c43288a-517d-4220-ad31-f84dda8c1805@yoseli.org>
In-Reply-To: <2c43288a-517d-4220-ad31-f84dda8c1805@yoseli.org>
From: Tomas Glozar <tglozar@redhat.com>
Date: Thu, 28 Nov 2024 16:25:45 +0100
Message-ID: <CAP4=nvTjdZRfWtpvM+gThPv6SghW96i9YykA88vAFH5x39GZqw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] Add basic tracing support for m68k
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vFgyMTF1lhYSqOObNjqzgLwfmBtswBqmN1yO1U2AMEg_1732807556
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

po 18. 11. 2024 v 11:13 odes=C3=ADlatel Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> napsal:
>
> I had to modify the source code a bit, as it does not compile with my
> uclibc toolchain:
> ...

glibc added a gettid() wrapper with version 2.30; earlier glibc and
uclibc do not have it. That can be fixed by conditionally including
the inline function if on glibc lower than 2.30 or another libc; for
reference on how to detect that, see how kernel self tests do it [1].

As of the FOPTS changes: are those necessary for rtla to build, or
were you just using them for easier debugging? AFAIK rtla shouldn't
depend on unwind tables or stack protection for functionality.

>
> But it is not enough, as executing rtla fails with a segfault.
> I can dump a core, but I could not manage to build gdb for my board so I
> can't debug it (I don't know how to debug a coredump without gdb !).
>
> JM
>

I have seen a similar libtraceevent-related rtla segfault recently on
ARM64, which was fixed by updating libtraceevent to a version that
includes the fix. Such issues are caused by the files for kernel
tracepoint tracefs having different contents on different
architectures, exposing bugs. I see Steven has already fixed one of
the issues on m68k [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/testing/selftests/nolibc/nolibc-test.c#n1008
[2] https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/commit/?=
id=3D45a9b0647c904b7bf1240da5a11fe3a1ffd1006d

Tomas

