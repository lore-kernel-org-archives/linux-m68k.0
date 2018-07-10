From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/3] [v2] powerpc: mac: fix rtc read/write
	functions
Date: Tue, 10 Jul 2018 11:18:34 +1000 (AEST)
Message-ID: <alpine.LNX.2.21.1807101105130.12@nippy.intranet>
References: <20180619140229.3615110-1-arnd@arndb.de>
 <CA+7wUsyN_gru4rW0y3ZzXzYwhfaA=uHKaOG=z5bprnYq6oVfMg@mail.gmail.com>
 <alpine.LRH.2.21.1807011844470.19761@math.ut.ee>
 <CAK8P3a29rNtWCcgKeJK57C5CPPi74wc1o1cnPJM=Qe+eMKFYjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <y2038-bounces@lists.linaro.org>
In-Reply-To: <CAK8P3a29rNtWCcgKeJK57C5CPPi74wc1o1cnPJM=Qe+eMKFYjw@mail.gmail.com>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/y2038/>
List-Post: <mailto:y2038@lists.linaro.org>
List-Help: <mailto:y2038-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=subscribe>
Errors-To: y2038-bounces@lists.linaro.org
Sender: "Y2038" <y2038-bounces@lists.linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-m68k@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, Michael Ellerman <mpe@ellerman.id.au>, Meelis Roos <mroos@linux.ee>, LKML <linux-kernel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andreas Schwab <schwab@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>
List-Id: linux-m68k@vger.kernel.org

T24gTW9uLCA5IEp1bCAyMDE4LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgoKPiAKPiBUaGUgbW9zdCBs
aWtlbHkgZXhwbGFuYXRpb24gSSBoYXZlIGhlcmUgaXMgdGhhdCB0aGUgUlRDIHdhcyBpbmRlZWQg
c2V0IAo+IHRvIGFuIGluY29ycmVjdCBkYXRlLCBlaXRoZXIgYmVjYXVzZSBvZiBhIGRlcGxldGVk
IGJhdHRlcnkgKG5vdCB1bmxpa2VseSAKPiBmb3IgYSB+MTUgeWVhciBvbGQgYm94KSBvciBiZWNh
dXNlIGl0IHdhcyBwcmV2aW91c2x5IHN0b3JlZCBpbmNvcnJlY3RseS4KClRoZSBQb3dlck1hYyBz
dG9yZXMgdGhlIEdNVCBvZmZzZXQgaW4gTlZSQU0sIGFuZCB0aGlzIGdldHMgdXNlZCB0byAKaW5p
dGlhbGl6ZSB0aW1lem9uZV9vZmZzZXQuCgpJZiB0aW1lem9uZV9vZmZzZXQgd2FzIG5lZ2F0aXZl
IGFuZCBub3cudHZfc2VjIHdhcyB6ZXJvLCBJIHRoaW5rIHRoaXMgCmNvdWxkIHN0b3JlIGEgMTk2
OSBkYXRlIGluIHRoZSBSVEM6CgppbnQgdXBkYXRlX3BlcnNpc3RlbnRfY2xvY2s2NChzdHJ1Y3Qg
dGltZXNwZWM2NCBub3cpCnsKICAgICAgICBzdHJ1Y3QgcnRjX3RpbWUgdG07CgogICAgICAgIGlm
ICghcHBjX21kLnNldF9ydGNfdGltZSkKICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwoK
ICAgICAgICBydGNfdGltZTY0X3RvX3RtKG5vdy50dl9zZWMgKyAxICsgdGltZXpvbmVfb2Zmc2V0
LCAmdG0pOwoKICAgICAgICByZXR1cm4gcHBjX21kLnNldF9ydGNfdGltZSgmdG0pOwp9CgpCdXQg
bWF5YmUgbm93LnR2X3NlYyBjYW4gYmUgc2hvd24gdG8gYmUgZ3JlYXRlciB0aGFuIHRpbWV6b25l
X29mZnNldC4KClRoZW4sIHdoYXQgd291bGQgaGFwcGVuIHdoZW4gdGhlIHRpbWV6b25lIGluIC9l
dGMvbG9jYWx0aW1lIGRpc2FncmVlcyB3aXRoIAp0aGUgdGltZXpvbmVfb2Zmc2V0IHN0b3JlZCBp
biBOVlJBTSAoUFJBTSk/CgpCZXNpZGVzIHRoYXQsIGlmIHRoZSBiYXR0ZXJ5IHdlbnQgZmxhdCwg
d2hhdCB1c2UgaXMgYSBiYWNrdHJhY2U/IFdoeSBub3QgCnNjcmFwIHRoZSBXQVJOX09OKCk/Cgot
LSAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWTIwMzgg
bWFpbGluZyBsaXN0ClkyMDM4QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8u
b3JnL21haWxtYW4vbGlzdGluZm8veTIwMzgK
