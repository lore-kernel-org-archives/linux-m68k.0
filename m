Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5CF12E4E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Mar 2024 05:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710308057; cv=none; b=SJIsdV45Do9m9hb+VdSxAOqqVlDJL2RmWAj6JlXMBlaP5+NU8ZAY2dYZQeBHOZ+z5Xad/bxmxreGci1Y2Jz9Jly2VUkCKCV3z3hhMCcVzJWZdc7Yg3m4CMwSKdAVUfE8rKH/4OlSvOENa98LcKy6fbvOCb5zJG4U2xdpJOY1U7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710308057; c=relaxed/simple;
	bh=zL3AnRSlqI71TMRHuS/adh7XNZWGK/TMjpMPZPqQCs0=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qmtkjiHIcR9Z5u/WhcucMLjDAfaTmpp4wjQRBUQyu6lCpba0e43TV7tvJF58NnFriBE46byJ+G4fpW7qSa/YZWKFliosm+Wshzl3xFQX+w6sEyuLMwSAKbTXmjsGDef2YegaIHuPTLp+sH0AGYgeGyC3Rr8vpGEBR3EZnAFMD3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmSzRTze; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmSzRTze"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so603178b6e.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Mar 2024 22:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710308054; x=1710912854; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWyWlswNvQrWEyou/cmyum8oAxCnDGO9uo+Dl4ok3E4=;
        b=cmSzRTzepg3AKRS0yJGPPEqBoZi8IxEbLunCRDgCC6WtPnOsdpfaE1QWWq2Zj51KU3
         Za4XcQijZ/sIOlMw7g5JJfPqPHttkLwcH3SGJ4cta94ymDWxO8+yaRdE5NuzWkXk/XzF
         XXbiT5hcl5MqizhZlI3zoFaQUFrSou9WoQAiIfhGCHhwFkwaudMFBr5b43Fkw1mTJf9j
         5BPVyT97z0hb5hqqkRZ9ANgI4pT2yFufmZDSG1ZjqFPhKk3aB2C6HJ61icRVNaLde/r9
         xpb71F3yI2U9nezqg5Xe/3lQ7hE5aMHrgO8O0E3M4398X8cjBTh2Qket3fu9VaAq1ep3
         BTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710308054; x=1710912854;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IWyWlswNvQrWEyou/cmyum8oAxCnDGO9uo+Dl4ok3E4=;
        b=TiL9UAPybSla/5ev4X0Tfj468SantaTvU221RT7JIhmhYe61t4goCQ/0bpmWRb8aVV
         OuGA352WdgXwHJSx5CsPMdg0rZgwHY9YS2b8nKVbBIYmDSWp4UmlpH6M3ysYl0hNMUWr
         J4dqYW2DW0xj04dFwRorZ7s3xf9wkgIk9lLhEctp4jGGbO+RRzhtjSHR30qaXw18gZQM
         aPUSpS3TaNqAMJwBD9ECR6tuy48TPz4W0w14YhGyXxb0ym7b9GKUzt1fFXWTl3f4fW40
         dLTc0W/M7exJURT0xMsJ2vYA2fKPbJvZDp4C737H5WrpZebxnheHEChDrQBNZaBvvApv
         kCFA==
X-Forwarded-Encrypted: i=1; AJvYcCUD6yDlWnmqlsHhZlep8H0o2RJqJ223UKvG9CqaHruqayTMWvjVwtePit5dBJP2GQW79xiZ39VVcZcB4N1ZKpaTMqoQo+fG83V2oszLzh16
X-Gm-Message-State: AOJu0YwO+uwKPQD3ncMPAQf82DzpMNDXK2INvHcdiSjFq2Ejb6RscLIv
	HTNWrSZfz+M2qEAULawnb3CYE9Ln6j+Mx0RINTkATtVVEf0gPRCxWs7wcxCC
X-Google-Smtp-Source: AGHT+IGhZYbCiaeFbIzAo82RWd/ZvM3p5uluMP4diH+xi1fZomAXx0LUVcGR0x4q3UwygrKrw3ABlA==
X-Received: by 2002:a05:6808:1b29:b0:3c2:71e7:572c with SMTP id bx41-20020a0568081b2900b003c271e7572cmr345166oib.28.1710308054029;
        Tue, 12 Mar 2024 22:34:14 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id c12-20020a62f84c000000b006e67edb113fsm6346763pfm.219.2024.03.12.22.34.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2024 22:34:13 -0700 (PDT)
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Finn Thain <fthain@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
 <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
 <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
 <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
 <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
 <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
 <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
 <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
 <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org>
 <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
 <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org>
 <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
 <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
 <0c7b96d2-1cf1-4fc1-876e-8e3bc859a1c5@gmail.com>
 <028f8edc-a08f-571a-0985-275394b60986@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6101c7dd-fa20-1d4b-13d2-8880702e960d@gmail.com>
Date: Wed, 13 Mar 2024 18:34:08 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <028f8edc-a08f-571a-0985-275394b60986@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 13.03.2024 um 17:40 schrieb Finn Thain:
> On Wed, 13 Mar 2024, Michael Schmitz wrote:
>
>>
>> Running a stack-ng stack-fill stressor triggered the panic, too. I'll
>> see how reliable that is.
>>
>
> I see an immediate failure with full preemption in QEMU when I run
> stress-ng -t 60 --zombie -1

Thanks - unfortunately, I don't have that available. Will see about 
adding that in ...

Cheers,

	Michael


