From: Josh Juran <jjuran@gmail.com>
Subject: Re: [GIT PULL] siginfo fix for v4.16-rc5
Date: Tue, 3 Apr 2018 11:24:58 -0400
Message-ID: <4A16C7EF-B8B7-457C-B49C-829B44F12FFE@gmail.com>
References: <87woypy8zc.fsf@xmission.com> <20180331105658.GA4332@asgard.redhat.com> <87woxpz7k9.fsf@xmission.com> <CAMuHMdVtbhGJ=nGbB21O73DcYM-4csyuJbx2NksN379ww6c1Gw@mail.gmail.com> <87in98xt4p.fsf@xmission.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87in98xt4p.fsf@xmission.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Eugene Syromiatnikov <esyr@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Apr 3, 2018, at 10:27 AM, Eric W. Biederman <ebiederm@xmission.com> =
wrote:

> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>=20
>> On Mon, Apr 2, 2018 at 10:17 PM, Eric W. Biederman =
<ebiederm@xmission.com> wrote:
>>=20
>>> A 2-byte alignment for 4 byte pointers.  That is a new one to me.
>>=20
>> Not just for pointers, also for int and long.
>=20
> The smallest I have seen previously has been 64bit integers having
> 32bit alignment.  32bit entities having only 16bit alignment on a =
32bit
> arch was simply a surprise.  Even when it works there tend to be good
> reasons not to do that by default.

The 68K architecture began as 16-bit with the 68000.  Rather than =
tightening requirements, the 68020 not only maintained compatibility =
with 16-bit alignment, but also forgave byte-misaligned data accesses =
(albeit with a performance penalty).  Jumping to an odd address is still =
an error, though.

Josh
